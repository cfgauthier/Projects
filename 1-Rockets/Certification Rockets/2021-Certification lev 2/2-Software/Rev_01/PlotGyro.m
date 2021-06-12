
function retVal = PlotGyro(DataMat,dpsConf, initialOffset)
    if dpsConf == 1000
        divFactor = 1;
    elseif dpsConf == 500
        divFactor = 2;
    elseif dpsConf == 250
        divFactor = 4;
    else
        divFactor = 1;
    end
    
    
    if initialOffset ~= 0
        figure
        subplot(3,2,1);
        a1 = plot(DataMat(initialOffset:end,1),DataMat(initialOffset:end,5));
        legend(a1,"X-gyro")
        xlabel("Acq. index")
        ylabel("Rotational accelation (2's complement)")
        ylim([-1000/divFactor 1000/divFactor])
    
        subplot(3,2,2);
        a4 = plot(DataMat(initialOffset:end,1),DataMat(initialOffset:end,5)/divFactor);
        legend(a4,"X-gyro")
        xlabel("Acq. index")
        ylabel("Rotational accelation (dps)")
        ylim([-1000/divFactor 1000/divFactor])
    
        subplot(3,2,3);
        a2 =plot(DataMat(initialOffset:end,1),DataMat(initialOffset:end,6));
        legend(a2,"Y-gyro")
        xlabel("Acq. index")
        ylabel("Rotational accelation (2's complement)")
        ylim([-1000/divFactor 1000/divFactor])
    
        subplot(3,2,4);
        a5 = plot(DataMat(initialOffset:end,1),DataMat(initialOffset:end,6)/divFactor);
        legend(a1,"Y-gyro")
        xlabel("Acq. index")
        ylabel("Rotational accelation (dps)")
        ylim([-1000/divFactor 1000/divFactor])
    
        subplot(3,2,5);
        a3 =plot(DataMat(initialOffset:end,1),DataMat(initialOffset:end,7));
        legend(a3,"Z-gyro")
        xlabel("Acq. index")
        ylabel("Rotational accelation (2's complement)")
        ylim([-1000/divFactor 1000/divFactor])
    
        subplot(3,2,6);
        a6 = plot(DataMat(initialOffset:end,1),DataMat(initialOffset:end,7)/divFactor);
        legend(a1,"Z-gyro")
        xlabel("Acq. index")
        ylabel("Rotational accelation (dps)")
        ylim([-1000/divFactor 1000/divFactor])
    
    
    else    
        subplot(3,2,1);
        a1 = plot(DataMat(:,1),DataMat(:,5));
        legend(a1,"X-gyro")
        xlabel("Acq. index")
        ylabel("Rotational accelation (2's complement)")
        ylim([-1000/divFactor 1000/divFactor])
    
        subplot(3,2,2);
        a4 = plot(DataMat(:,1),DataMat(:,5)/divFactor);
        legend(a4,"X-gyro")
        xlabel("Acq. index")
        ylabel("Rotational accelation (dps)")
        ylim([-1000/divFactor 1000/divFactor])
    
        subplot(3,2,3);
        a2 =plot(DataMat(:,1),DataMat(:,6));
        legend(a2,"Y-gyro")
        xlabel("Acq. index")
        ylabel("Rotational accelation (2's complement)")
        ylim([-1000/divFactor 1000/divFactor])
    
        subplot(3,2,4);
        a5 = plot(DataMat(:,1),DataMat(:,6)/divFactor);
        legend(a1,"Y-gyro")
        xlabel("Acq. index")
        ylabel("Rotational accelation (dps)")
        ylim([-1000/divFactor 1000/divFactor])
    
        subplot(3,2,5);
        a3 =plot(DataMat(:,1),DataMat(:,7));
        legend(a3,"Z-gyro")
        xlabel("Acq. index")
        ylabel("Rotational accelation (2's complement)")
        ylim([-1000/divFactor 1000/divFactor])
    
        subplot(3,2,6);
        a6 = plot(DataMat(:,1),DataMat(:,7)/divFactor);
        legend(a1,"Z-gyro")
        xlabel("Acq. index")
        ylabel("Rotational accelation (dps)")
        ylim([-1000/divFactor 1000/divFactor])
    
    end
    sgtitle('Rocket rotational acceleration during flight')
end