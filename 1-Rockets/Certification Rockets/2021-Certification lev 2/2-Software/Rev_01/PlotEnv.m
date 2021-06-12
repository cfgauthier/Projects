function [retVal] = PlotEnv(DataMat, initialOffset)
    
    if initialOffset ~= 0
        
        %Plot temperature over time
        figure
        subplot(3,2,1);
        a1 = plot(DataMat(initialOffset:end ,1),DataMat(initialOffset:end ,8));
        legend(a1,"Temperature")
        xlabel("Acq. index")
        ylabel("Degrees Celsius (2's complement)")
        %Plot pressure over time
        subplot(3,2,3)
        a3 = plot(DataMat(initialOffset:end ,1),DataMat(initialOffset:end ,9));
        legend(a3,"Pressure")
        xlabel("Acq. index")
        ylabel("Pressure (2's complement)")
    
        subplot(3,2,4)
        pressurehPa = DataMat(initialOffset:end ,9)/100;
        a4 = plot(DataMat(initialOffset:end ,1),pressurehPa);
        legend(a3,"Pressure")
        xlabel("Acq. index")
        ylabel("Pressure (hPa)")
        %Plot humidity over time
        subplot(3,2,5)
        a5 = plot(DataMat(initialOffset:end ,1),DataMat(initialOffset:end ,8));
        legend(a5,"Humidity")
        xlabel("Acq. index")
        ylabel("Humidity (2's complement)")
    
        seaLevelhPa = pressurehPa(20,1);%seaLevelhPa = 1013;
        figure
        altitude = 44330*(1-((pressurehPa/seaLevelhPa).^0.1903));
        a7 = plot(DataMat(initialOffset:end ,1),altitude);
        legend(a7,"Altitude")
        xlabel("Acq. index")
        ylabel("Altitude (X's)")
    
    
    else
        
        %Plot temperature over time
        figure
        subplot(3,2,1);
        a1 = plot(DataMat(:,1),DataMat(:,8));
        legend(a1,"Temperature")
        xlabel("Acq. index")
        ylabel("Degrees Celsius (2's complement)")
        %Plot pressure over time
        subplot(3,2,3)
        a3 = plot(DataMat(:,1),DataMat(:,9));
        legend(a3,"Pressure")
        xlabel("Acq. index")
        ylabel("Pressure (2's complement)")
    
        subplot(3,2,4)
        pressurehPa = DataMat(:,9)/100;
        a4 = plot(DataMat(:,1),pressurehPa);
        legend(a3,"Pressure")
        xlabel("Acq. index")
        ylabel("Pressure (hPa)")
        %Plot humidity over time
        subplot(3,2,5)
        a5 = plot(DataMat(:,1),DataMat(:,8));
        legend(a5,"Humidity")
        xlabel("Acq. index")
        ylabel("Humidity (2's complement)")
    
        seaLevelhPa = pressurehPa(20,1);
        figure
        altitude = 44330*(1-((pressurehPa/seaLevelhPa).^0.1903));
        a7 = plot(DataMat(:,1),altitude);
        legend(a7,"Altitude")
        xlabel("Acq. index")
        ylabel("Altitude (X's)")
    
    end
end

