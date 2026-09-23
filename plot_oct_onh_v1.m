%
% Plot OCT ONH
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
cx = 4.2;
cy = 5.3;
H  = 1.4;
W  = 1.4;
K  = 9;
A  = 0.5;

% Graph Locations
xp = cos([0 90-20 90+20 180 270-20 270+20]*pi/180)*2.9;
yp = sin([0 90-20 90+20 180 270-20 270+20]*pi/180)*2.9;
xp(7) = 0;
yp(7) = 0;

% Y Limits
yl = [60 55  60  60  100 60  75; ...
      95 185 185 100 190 150 130];

% Panel titles
ti{1} = 'Nasal';
ti{2} = 'Nasal Superior';
ti{3} = 'Temporal Superior';
ti{4} = 'Temporal';
ti{5} = 'Inferior Temporal';
ti{6} = 'Inferior Nasal';
ti{7} = 'Mean ONH';

% Location of Cohen's d on each axes
d_y = [62 65 70 62 110 70 80];

hf = figure;
nlp_fig_prep(hf, 'Portrait');

tt = 1

%
% Background image
%
ha = axes;
nlp_axes_prep(ha);
hold on
set(gca,'Position',[.5 1 8 8]  ); % gca = graphical current axes % left bottom width height
%set(gca,'FontSize', 12                          );
%set(gca,'YLim',    [60 95  ]                    );
%set(gca,'XLim',    [0.5 4.5 ]                   );
%set(gca,'XTick',   [1 2 3 4 ]                   );
%set(gca,'LineWidth',1.5                         );
imshow('Glaucoma4-Fovea-01-HD copy.jpg')

% New loop for the axes

for ax = 1:7

   %
   % First graph onh(1) - 90 deg
   %
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
      hp=patch([-1 -1 5 5],[48.5 100 100 48.5], [.99 .99 .99]);
   else      %hp=patch([-1 -1 5 5],[48.5 100 100 48.5], [.99 .99 .99]);
      hp=patch([-.4 -.4 5.4 5.4],[55.5 100 100 55.5], [.99 .99 .99]);
   end
   set(hp,'EdgeColor','none')
   alpha(hp,A);
   % Graph
   ha = axes;
   nlp_axes_prep(ha);
   hold on
   set(gca,'Position',[(cx+xp(ax)) (cy+yp(ax)) H W]  ); % gca = graphical current axes % left bottom width height
   set(gca,'FontSize', 12                          );
   set(gca,'YLim',    yl(1:2,ax)'                  );
   set(gca,'XLim',    [0.5 2.5 ]                   );
   set(gca,'XTick',   [1 2]                        );
   set(gca,'LineWidth',1.5                         );
   if ax == 2 || ax == 6
      set(gca,'YAxisLocation','Right'                 );
   else

      set(gca,'YAxisLocation','Left'                  );
   end
   if ax > 1
      set(gca,'XTickLabel', [] );
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
               y1(tp).d(i) = sub(s).visit(tp).d_oct(1).onh(ax);
               ii = ii + 1;
               an_t(ii,1:3) = [0 tp sub(s).visit(tp).d_oct(1).onh(ax)];
            end %data exist
         elseif sub(s).concussed == 1
            if size(sub(s).visit,2) >= tp
               j = j + 1;
               x2(tp).d(j) = tp+( (0.5-rand(1,1))/K );
               y2(tp).d(j) = sub(s).visit(tp).d_oct(1).onh(ax);
               ii = ii + 1;
               an_t(ii,1:3) = [1 tp sub(s).visit(tp).d_oct(1).onh(ax)];
            end %data exist
         end
      end %for s
      plot(x1(tp).d,y1(tp).d,'o','MarkerSize',6,'Color',ORANGE );
      plot(x2(tp).d,y2(tp).d,'o','MarkerSize',6,'Color',CYAN   );
      x1a(tp)=mean(x1(tp).d);
      y1a(tp)=mean(y1(tp).d);
      x2a(tp)=mean(x2(tp).d);
      y2a(tp)=mean(y2(tp).d);

      StatsTable_ONH(tp).stats{tt,1} = nanmean(y1(tp).d );
      StatsTable_ONH(tp).stats{tt,2} = nanstd( y1(tp).d );
      StatsTable_ONH(tp).stats{tt,3} = nanmean(y2(tp).d );
      StatsTable_ONH(tp).stats{tt,4} = nanstd( y2(tp).d );
      d = meanEffectSize(y1(tp).d,y2(tp).d, effect="Cohen");
      StatsTable_ONH(tp).stats{tt,5} = d{:,1};

   end %for tp

   cntrl_means2 = nanmean([y1(1).d y1(2).d],2);
   cntrl_std2   = nanstd([ y1(1).d y1(2).d],0,2);
   cntrl_cv2    = cntrl_std2/cntrl_means2*100;
   cntrl_d2     =  meanEffectSize(y1(1).d,y1(2).d, effect="Cohen");
   concuss_means2 = mean([y2(1).d y2(2).d],2);
   concuss_std2   = std([ y2(1).d y2(2).d],0,2);
   concuss_cv2    = concuss_std2/concuss_means2*100;
   concuss_d2     =  meanEffectSize(y2(1).d,y2(2).d, effect="Cohen");
   StatsTable_ONH2.stats(tt,1) = cntrl_cv2;
   StatsTable_ONH2.stats(tt,2) = concuss_cv2;
   StatsTable_ONH2.stats(tt,3) = cntrl_d2{:,1};
   StatsTable_ONH2.stats(tt,4) = concuss_d2{:,1};


   plot( x1a, y1a, '-s', 'LineWidth',2,'MarkerEdgeColor',BLACK, 'MarkerFaceColor', ORANGE,'Color', ORANGE );
   plot( x2a, y2a, '-s', 'LineWidth',2,'MarkerEdgeColor',BLACK, 'MarkerFaceColor', CYAN,  'Color', CYAN   );
   title(ti{ax} );

   % Stats
   an_t2 = array2table(an_t,'VariableNames',{'Concuss','Time_Point','OCT'});
   mdl   = fitglm(an_t2,'OCT ~ Concuss*Time_Point - Concuss:Time_Point');
   d3 = meanEffectSize(y1(1).d,y2(1).d, effect="Cohen");
   d4 = meanEffectSize(y1(2).d,y2(2).d, effect="Cohen");
   text(.7,d_y(ax),['d= ' num2str(d3{:,1},'%3.2f') '     ' num2str(d4{:,1},'%3.2f')]);
   %text(1,62,['p=' num2str(mdl.Coefficients{2,4},'%4.3f') ' p =' num2str(mdl.Coefficients{3,4},'%4.3f') ])
   if ax == 1
      ylabel('Thickness (\mum)' );
      xlabel('Time Point');
   end

   % Key
   if ax == 1
      set(gca,'Clipping','Off')
      plot(0.9, 45, 'o', 'MarkerSize', 6, 'Color', ORANGE              );
      plot(0.9, 40, 'o', 'MarkerSize', 6, 'Color', CYAN                );
      plot(0.9, 35, 'S', 'MarkerSize', 6, 'Color', BLACK,'LineWidth',2 );
      text(1.0, 45, ['Control = '   num2str(length(x1(1).d))], 'Color', ORANGE );
      text(1.0, 40, ['Concussed = ' num2str(length(x2(1).d))], 'Color', CYAN   );
      text(1.0, 35, 'Mean'       );
      %text(1.6, 29,'\bfEffectSize:'   );
      %text(1.6, 25,'Time-Point 1 & ');
      %text(1.6, 21,'Time-Point 2'  );
   end


tt = tt +1;
end %for ax




% fini
