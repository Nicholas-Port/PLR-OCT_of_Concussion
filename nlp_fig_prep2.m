function nlp_fig_prep2 (h_fig,temp_text,i)
% nlp_fig_prep The function prepares a figure for units in inches, generally used for pulication figures


fubar=get(0,'ScreenSize');

%set(0,'Units','Inches');

switch temp_text

   case 'Landscape'
      set (h_fig,'PaperOrientation','Landscape'    );
      set (h_fig,'Units',           'inches'       );
      set (h_fig,'PaperPosition',   [0 0 11 8.5]   );
      set (h_fig,'Position',        [.5 .5 11 8.5] );

   case 'Portrait'
      set (h_fig,'PaperOrientation','Portrait'     );
      switch i
         case 1
            set (h_fig,'Units',    'Normalized'                          ); %inches
            set (h_fig,'Position', [ 0 0 .9*8.5/11*fubar(4)/fubar(3) .9] );
         case 2
            set (h_fig,'Units', 'Inches'         ); 
            set (h_fig,'Position',[.5 .5 8.5 11] );
     end
      set (h_fig,'PaperPosition',   [0 0 8.5 11]   );% [0 0 8.5 11]
      
     
end
