function [returnVal,csvMatAppend] = AcquireData(dataPath, debug)
    if exist(dataPath,'dir')
        dirData = dir(dataPath);
        allFiles = strings(1,length(dirData));
        validFileID = 1;
        
        %List all available datafiles
        for i = 1:length(dirData)
           if contains(dirData(i).name,".CSV")
                allFiles(1,validFileID) = dirData(i).name;
                if debug
                    fprintf("File %d to read: %s.\n",validFileID,dirData(i).name) 
                end
                validFileID  = validFileID+1;
           else
               if debug
                    fprintf("Following file not recognized at index %d: %s.\n",i,dirData(i).name)
               end
           end
        end
        
        %Read all data files
        csvMat = cell(1,validFileID);
        for i = 1:validFileID-1
            %Ask to start numbering at file 1 and remove the -1.
            filePath = dataPath+"\"+string(i-1)+".CSV";
            csvMat{i} = csvread(filePath,2);
            if(debug)
                fprintf("File %d read.\n", i);
            end
        end
        csvMatAppend = vertcat(csvMat{:});
        returnVal = true;
    else
        returnVal = false;
        display("Data path used for import does not exist.")
    end
    
end
