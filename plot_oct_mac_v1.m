%
% Plot OCT Macula
%

%close all

%COLORS
RED       = [0.90 0.00 0.15 ];
MAGENTA   = [0.80 0.00 0.80 ];
ORANGE    = [1.00 0.50 0.00 ];
YELLOW    = [1.00 0.68 0.26 ];
GREEN     = [0.09 0.45 0.27 ];
CYAN      = [0.28 0.82 0.80 ];
BLUE      = [0.00 0.00 1.00 ];
BLACK     = [0.00 0.00 0.05 ];

% This script will plot the OCT data in standard ciruclar map type
% arrangements for OCT

% Design for the page 
% first center
cx = 4.0;
cy = 5.3;
H  = 1.0;
W  = 1.0;
K  = 9;
A  = 0.5;

% Graph Locations
xp = [ cos([0 90 180 270 ]*pi/180)*1.7  cos([0 90 180 270 ]*pi/180)*3.2  ];
yp = [ sin([0 90 180 270 ]*pi/180)*1.7  sin([0 90 180 270 ]*pi/180)*3.2  ];

xp(9) = 0;
yp(9) = 0;


% YLim for all the axes
p(1).ylim(1, 1:2) = [ 13 32  ] ;
p(1).ylim(2, 1:2) = [ 17 34  ] ;
p(1).ylim(3, 1:2) = [ 14 19  ] ;
p(1).ylim(4, 1:2) = [ 19 32  ] ;
p(1).ylim(5, 1:2) = [ 35 70  ] ;
p(1).ylim(6, 1:2) = [ 25 50  ] ;
p(1).ylim(7, 1:2) = [ 15 20  ] ;
p(1).ylim(8, 1:2) = [ 23 55  ] ;
p(1).ylim(9, 1:2) = [  5 17  ] ;

p(2).ylim(1, 1:2) = [ 310 390  ] ;
p(2).ylim(2, 1:2) = [ 310 390  ] ;
p(2).ylim(3, 1:2) = [ 300 380  ] ;
p(2).ylim(4, 1:2) = [ 300 380  ] ;
p(2).ylim(5, 1:2) = [ 280 350  ] ;
p(2).ylim(6, 1:2) = [ 250 360  ] ;
p(2).ylim(7, 1:2) = [ 250 330  ] ;
p(2).ylim(8, 1:2) = [ 260 320  ] ;
p(2).ylim(9, 1:2) = [ 220 330  ] ;


p(3).ylim(1, 1:2) = [ 45 70  ] ;
p(3).ylim(2, 1:2) = [ 45 70  ] ;
p(3).ylim(3, 1:2) = [ 40 60  ] ;
p(3).ylim(4, 1:2) = [ 45 60  ] ;

p(3).ylim(5, 1:2) = [ 32 45  ] ;
p(3).ylim(6, 1:2) = [ 28 45  ] ;
p(3).ylim(7, 1:2) = [ 26 55  ] ;
p(3).ylim(8, 1:2) = [ 27 45  ] ;
p(3).ylim(9, 1:2) = [  1 34  ] ;



% Y Text for the p-values
p(1).ty(1) = 15.0;
p(1).ty(2) = 18.5;
p(1).ty(3) = 14.5;
p(1).ty(4) = 20.0;
p(1).ty(5) = 38.0;
p(1).ty(6) = 27.0;
p(1).ty(7) = 15.5;
p(1).ty(8) = 25.5;
p(1).ty(9) = 6.0;

p(2).ty(1) = 318;
p(2).ty(2) = 318;
p(2).ty(3) = 308;
p(2).ty(4) = 308;

p(2).ty(5) = 287;
p(2).ty(6) = 259;
p(2).ty(7) = 257;
p(2).ty(8) = 266;
p(2).ty(9) = 230;

p(3).ty(1) = 47;
p(3).ty(2) = 47;
p(3).ty(3) = 42;
p(3).ty(4) = 46;

p(3).ty(5) = 33;
p(3).ty(6) = 30;
p(3).ty(7) = 28;
p(3).ty(8) = 29;
p(3).ty(9) = 4;


% Titles for each axes
ti{1} = 'Nasal Inner';
ti{2} = 'Superior Inner';
ti{3} = 'Temporal Inner';
ti{4} = 'Inferior Inner';
ti{5} = 'Nasal Outer';
ti{6} = 'Superior Outer';
ti{7} = 'Temporal Outer';
ti{8} = 'Inferior Outer';
ti{9} = 'Center';


% Graph Order
gr_or(1:9)= [2 3 4 5 6 7 8 9 1];

% Key
k(1).k = [  3    0  -3    -6   -9  -12 ];
k(2).k = [ 263 251  239  228  216  202 ];
k(3).k = [ 31   27   23  19    16   13 ];


for f = 1 : 3
   
   hf = figure;
   nlp_fig_prep(hf, 'Portrait');
   
   
   %
   % Background image
   %
   ha = axes;
   nlp_axes_prep(ha);
   hold on
   set(gca,'Position',[1.2 1.2 8.3 8.3]  ); % gca = graphical current axes % left bottom width height
   %imshow('Macula-OCT.jpg')
   imshow('Widefiled_Fundus_2-IR-HD.jpg')

   tt = 1; %for making thickness table
   
   
   % Putting in a new axis loop
   for ax = 1:9

      % First graph mac(2) - 0 deg

      % Background
      ha = axes; nlp_axes_prep(ha);hold on
      set(gca,'Position',[(cx+xp(ax)) (cy+yp(ax)) H W]  ); % gca = graphical current axes % left bottom width height
      set(gca,'Clipping','Off'                        );
      set(gca,'YLim',    [60 95  ]                    );
      set(gca,'XLim',    [0.5 4.5 ]                   );
      set(gca,'XColor',  'none'                       );
      set(gca,'YColor',  'none'                       );
      set(gca,'Color',   'none'                       );
      if ax == 1
         hp=patch([-1.55 -1.55 4.9 4.9],[4 103 103 4], [.99 .99 .99]);
      else
         hp=patch([-0.8 -0.8 5.1 5.1],[57 103 103 57], [.99 .99 .99]);
      end
      set(hp,'EdgeColor','none')
      alpha(hp,A);
      % Graph
      ha = axes;
      nlp_axes_prep(ha);
      hold on
      set(gca,'Position', [(cx+xp(ax)) (cy+yp(ax)) H W]  ); % gca = graphical current axes % left bottom width height
      set(gca,'FontSize', 12                           );
      set(gca,'YLim',     p(f).ylim(ax,:)               );
      set(gca,'XLim',     [0.5 2.5 ]                   );
      set(gca,'XTick',    [1 2]                        );
      set(gca,'LineWidth',1.5                          );
      if ax > 1
            set(gca,'XTickLabel',    []                );
      end
      clear x1 y1 x2 y2 x1a y1a x2a y2a
      ii = 0; clear an_t
      for tp = 1:2
         i = 0;
         j = 0;
         for s= 1:length(sub)
            if sub(s).concussed == 0
               if size(sub(s).visit,2) >= tp
                  i = i + 1;
                  x1(tp).d(i) = tp+( (0.5-rand(1,1))/K );
                  y1(tp).d(i) = sub(s).visit(tp).d_oct(f).mac(gr_or(ax));
                  ii = ii + 1;
                  an_t(ii,1:3) = [0 tp sub(s).visit(tp).d_oct(f).mac(gr_or(ax))];
               end %data exist
            elseif sub(s).concussed == 1
               if size(sub(s).visit,2) >= tp
                  j = j + 1;
                  x2(tp).d(j) = tp+( (0.5-rand(1,1))/K );
                  y2(tp).d(j) = sub(s).visit(tp).d_oct(f).mac(gr_or(ax));
                  ii = ii + 1;
                  an_t(ii,1:3) = [1 tp sub(s).visit(tp).d_oct(f).mac(gr_or(ax))];

               end %data exist
            end
         end %for s
         plot(x1(tp).d,y1(tp).d,'o','MarkerSize',6,'Color',ORANGE );
         plot(x2(tp).d,y2(tp).d,'o','MarkerSize',6,'Color',CYAN   );
         x1a(tp) = nanmean( x1(tp).d );
         y1a(tp) = nanmean( y1(tp).d );
         x2a(tp) = nanmean( x2(tp).d );
         y2a(tp) = nanmean( y2(tp).d );

         StatsTable_MAC(tp).layer(f).stats(tt,1) = nanmean(y1(tp).d );
         StatsTable_MAC(tp).layer(f).stats(tt,2) = nanstd( y1(tp).d );
         StatsTable_MAC(tp).layer(f).stats(tt,3) = nanmean(y2(tp).d );
         StatsTable_MAC(tp).layer(f).stats(tt,4) = nanstd( y2(tp).d );
         d = meanEffectSize(y1(tp).d,y2(tp).d, effect="Cohen");

         StatsTable_MAC(tp).layer(f).stats(tt,5) = d{:,1};

      end %for tp

      % CV

      cntrl_means = mean([y1(1).d y1(2).d],2);
      cntrl_std   = std([ y1(1).d y1(2).d],0,2);
      cntrl_cv    = cntrl_std/cntrl_means*100;
      cntrl_d     =  meanEffectSize(y1(1).d,y1(2).d, effect="Cohen");
      concuss_means = mean([y2(1).d y2(2).d],2);
      concuss_std   = std([ y2(1).d y2(2).d],0,2);
      concuss_cv    = concuss_std/concuss_means*100;
      concuss_d     =  meanEffectSize(y2(1).d,y2(2).d, effect="Cohen");
      StatsTable_MAC2.layer(f).stats(tt,1) = cntrl_cv;
      StatsTable_MAC2.layer(f).stats(tt,2) = concuss_cv;
      StatsTable_MAC2.layer(f).stats(tt,3) = cntrl_d{:,1};
      StatsTable_MAC2.layer(f).stats(tt,4) = concuss_d{:,1};



      plot( x1a, y1a, '-s', 'LineWidth',2,'MarkerEdgeColor',BLACK, 'MarkerFaceColor', ORANGE,'Color', ORANGE );
      plot( x2a, y2a, '-s', 'LineWidth',2,'MarkerEdgeColor',BLACK, 'MarkerFaceColor', CYAN,  'Color', CYAN   );
      title( ti{ax} )
      % Stats
      an_t2 = array2table(an_t,'VariableNames',{'Concuss','Time_Point','OCT'});
      %mdl   = fitglm(an_t2,'OCT ~ Concuss*Time_Point - Concuss:Time_Point');
      mdl   = fitglm(an_t2,'OCT ~ Concuss + Time_Point ');
      %keyboard
      %text(0.75,p(f).ty(1),['p=' num2str(mdl.Coefficients{2,4},'%4.3f') ' p =' num2str(mdl.Coefficients{3,4},'%4.3f') ])
      d3 = meanEffectSize(y1(1).d,y2(1).d, effect="Cohen");
      d4 = meanEffectSize(y1(2).d,y2(2).d, effect="Cohen");
      text(0.55,p(f).ty(ax),['d= ' num2str(d3{:,1},'%3.2f') '  ' num2str(d4{:,1},'%3.2f')]);

      % Key - only the first graph
      if ax == 1
         ylabel('Thickness (\mum)' );
         xlabel('Time Point');

         set(gca,'Clipping','Off')
         plot(0,    k(f).k(1), 'o', 'MarkerSize', 6, 'Color', ORANGE             ,'LineWidth',2 );
         plot(0,    k(f).k(2), 'o', 'MarkerSize', 6, 'Color', CYAN               ,'LineWidth',2 );
         plot(0,    k(f).k(3), 'S', 'MarkerSize', 6, 'Color', BLACK,'LineWidth',2 );
         text(0.22, k(f).k(1), ['Control = '   num2str(length(x1(1).d))], 'Color', ORANGE );
         text(0.22, k(f).k(2), ['Concussed = ' num2str(length(x2(1).d))], 'Color', CYAN   );
         text(0.22, k(f).k(3), 'Mean'            );
         text(0.22, k(f).k(4), '\bfEffectSize:'  );
         text(0.22, k(f).k(5), 'Time-Point 1 & ' );
         text(0.22, k(f).k(6), 'Time-Point 2'    );
      end

      % Page Title
      if ax == 1
         switch f
            case 1
               text(-10,101,'Nerve Fiber Layer','FontSize',24);
            case 2
               text( -9,680,'Total Thickness','FontSize',24);
            case 3
               text(-10,161,'Ganglion Cell Layer','FontSize',24);
         end
      end

      tt = tt +1;
   end %for ax  - axes loop

end %for f - number of figures






% fini