%% Data extractor for flightData analysis
% Charles-Frederick Gauthier
% Université de Sherbrooke
% 2021-06-03
close all
clear all
%% Path parameters
scriptPath = "C:\Repos\ProjectsGitHub\Projects\1-Rockets\Certification Rockets\2021-Certification lev 2\2-Software";
dataPath = scriptPath+"\InputData";
acquisitionPath = "";

debug = 1;
loggingDataFormat = "csv"; %Or "raw"
dataOffset = 1020000;

%% Data acquisition from folder architecture
clc
csvData = 0;
%Check that we have the InputData folder
InputDatadirData = dir(scriptPath);
InputDataDirOK = false;
for i = 1:length(InputDatadirData)
    if(strcmp(InputDatadirData(i).name, "InputData"))
        InputDataDirOK = true;
    end
end

if InputDataDirOK == true
    disp("InputData directory found.")
    AcquisitiondirData = dir(dataPath);
    selectedAcquisition = "";
    if length(AcquisitiondirData) ~= 0
        disp("Select one of the following acquisition period to import:")
        for i = 1:length(AcquisitiondirData)
            fprintf("%d: %s.\n",i,AcquisitiondirData(i).name)
        end
        userInput = input(selectedAcquisition);
        if userInput >= length(AcquisitiondirData) || userInput <= 1
            disp("Please select one of the available period.")
        else
            acquisitionPath = dataPath+"\"+AcquisitiondirData(userInput).name;
        end
        %Acquire all the CSV data in one matrix
        [retVal, csvData] = AcquireData(acquisitionPath,0);
        %Columns: TimeStamp(ms),accx,accy,accz,gyrx,gyry,gyrz, tempC,
        %press, humi
        %Acceleration either 2, 4, 8 or 16g
        PlotAcceleration(csvData,16,dataOffset);
        %DPS Conf either 1000, 500 or 250
        PlotGyro(csvData,1000,dataOffset);
        %Plot the environmental data
        PlotEnv(csvData,dataOffset);
    else
        disp("No acquistion period in the folder.")
    end
    
else
    disp("InputData directory missing.")
end
