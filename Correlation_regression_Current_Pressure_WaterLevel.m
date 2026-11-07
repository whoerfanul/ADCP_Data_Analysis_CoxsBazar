clc; clear;

load WaterLevel_Pressure_Current.mat;

%SCur=Current_Speed_at_150_cm; 
%P=Water_Pressure;
%WL=Water_Level;

A=[SCur(:,1),P(:,1),WL(:,1)];

     caption = 'Correlation and regression fit among the temporal variation of different parameters';
    Var ={'Current Speed (m/s)' 'Water Pressure (Pa)' 'Water Level (m)'};
      
    [Rho P] = fcnCorrMatrixPlot(A, Var, caption)

exportgraphics(gcf,['correlation_wave_current_new.png'],'Resolution',1000);