function nlp_axes_prep2 (h_axes, i)
% nlp_axes_prep The function formats an axes with standard items, i.e. units in inches, etc
% 
% Tick Dir. Out
% Box Off
% FontSize 6

switch i
   case 1
      set (h_axes, 'Units',   'Normalized'         ); %Inches
   case 2
      set (h_axes, 'Units',   'Inches'         ); %Inches
end
set (h_axes, 'TickDir', 'Out'            );
set (h_axes, 'Box',     'Off'            );
set (h_axes, 'FontSize', 6               );
set (h_axes, 'FontName', 'Times New Roman' );
%set (h_axes, 'FontName', 'Arial' );


