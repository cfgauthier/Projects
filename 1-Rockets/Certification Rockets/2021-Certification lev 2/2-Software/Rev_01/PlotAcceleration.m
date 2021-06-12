
function retVal = PlotAcceleration(DataMat,Gvalue, initialOffset)
    %Gvalue is either 2,4,8 or 16g offset.
    gOffset = 16384*2/Gvalue;
    
    if initialOffset ~= 0
        figure
        subplot(3,2,1);
        a1 = plot(DataMat(initialOffset:end,1),DataMat(initialOffset:end,2));
        legend(a1,"X-acceleration")
        xlabel("Acq. index")
        ylabel("Accelation (2's complement)")
    
        subplot(3,2,2)
        a4 = plot(DataMat(initialOffset:end,1),DataMat(initialOffset:end,2)/gOffset);
        legend(a4,"X-acceleration converted")
        xlabel("Acq. index")
        ylabel("Accelation (g's)")
        ylim([-Gvalue Gvalue])
    
        subplot(3,2,3);
        a2 = plot(DataMat(initialOffset:end,1),DataMat(initialOffset:end,3));
        legend(a2,"Y-acceleration")
        xlabel("Acq. index")
        ylabel("Accelation (2's complement)")
    
        subplot(3,2,4)
        a5 = plot(DataMat(initialOffset:end,1),DataMat(initialOffset:end,3)/gOffset);
        legend(a5,"Y-acceleration converted")
        xlabel("Acq. index")
        ylabel("Accelation (g's)")
        ylim([-Gvalue Gvalue])
    
        subplot(3,2,5);
        a3 = plot(DataMat(initialOffset:end,1),DataMat(initialOffset:end,4));
        legend(a3,"Z-acceleration")
        xlabel("Acq. index")
        ylabel("Accelation (2'complement)")
    
        subplot(3,2,6)
        a6 = plot(DataMat(initialOffset:end,1),DataMat(initialOffset:end,4)/gOffset);
        legend(a6,"Z-acceleration converted")
        xlabel("Acq. index")
        ylabel("Accelation (g's)")
        ylim([-Gvalue Gvalue])
    
        sgtitle('Rocket linear acceleration during flight')
    else
        figure
        subplot(3,2,1);
        a1 = plot(DataMat(:,1),DataMat(:,2));
        legend(a1,"X-acceleration")
        xlabel("Acq. index")
        ylabel("Accelation (2's complement)")
    
        subplot(3,2,2)
        a4 = plot(DataMat(:,1),DataMat(:,2)/gOffset);
        legend(a4,"X-acceleration converted")
        xlabel("Acq. index")
        ylabel("Accelation (g's)")
        ylim([-Gvalue Gvalue])
    
        subplot(3,2,3);
        a2 = plot(DataMat(:,1),DataMat(:,3));
        legend(a2,"Y-acceleration")
        xlabel("Acq. index")
        ylabel("Accelation (2's complement)")
    
        subplot(3,2,4)
        a5 = plot(DataMat(:,1),DataMat(:,3)/gOffset);
        legend(a5,"Y-acceleration converted")
        xlabel("Acq. index")
        ylabel("Accelation (g's)")
        ylim([-Gvalue Gvalue])
    
        subplot(3,2,5);
        a3 = plot(DataMat(:,1),DataMat(:,4));
        legend(a3,"Z-acceleration")
        xlabel("Acq. index")
        ylabel("Accelation (2'complement)")
    
        subplot(3,2,6)
        a6 = plot(DataMat(:,1),DataMat(:,4)/gOffset);
        legend(a6,"Z-acceleration converted")
        xlabel("Acq. index")
        ylabel("Accelation (g's)")
        ylim([-Gvalue Gvalue])
    
        sgtitle('Rocket linear acceleration during flight')
    end
    
end