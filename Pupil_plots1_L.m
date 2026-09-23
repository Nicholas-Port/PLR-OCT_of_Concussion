% Pupil plots
%Non Normalized

clear m11 m12 m21 m22
clear en ey
clear jc JC1 JC2 

USE_E_DATA =1;

if ~USE_E_DATA
   figure
   subplot(4,2,1); hold on;
   subplot(4,2,2); hold on;
   subplot(4,2,3); hold on;
   subplot(4,2,4); hold on;
   subplot(4,2,5); hold on;
   subplot(4,2,6); hold on;
   subplot(4,2,7); hold on;
   subplot(4,2,8); hold on;
end

JC1 = [1 3 5 7];
JC2 = [2 4 6 8];
for e = 1:4
   en(e).i=0;
   ey(e).i=0;
end
%i1 = 0;
%i2 = 0;

MAX_D = 3;

if USE_E_DATA == 0

   for s = 1:length(sub)
      disp(s)

      for e = 1:length(sub(s).ex)

         if ~isempty(sub(s).ex(e).d)
            %if ~strcmp(sub(s).ex(1).fn,'') && (~strcmp(sub(s).ex(2).fn,'') || ~strcmp(sub(s).ex(3).fn,''))

            if sub(s).con == 0 % Column 1)
               jc = JC1;
               t1_str = 'concussed';
            elseif sub(s).con == 1
               jc = JC2;
               t1_str = 'control';
            end

            subplot(4,2,jc(e) )
            plot(nanmean(sub(s).ex(e).d(1).t_m),nanmean(sub(s).ex(e).d(1).pa_m1),'b-');
            plot(nanmean(sub(s).ex(e).d(2).t_m),nanmean(sub(s).ex(e).d(2).pa_m1),'r-');
            plot(nanmean(sub(s).ex(e).d(3).t_m),nanmean(sub(s).ex(e).d(3).pa_m1),'g-');



            % Create structures for mean & SE plots
            if sub(s).con == 0
               en(e).i = en(e).i + 1;
               for d = 1:3
                  en(e).d(d).t( en(e).i,:) = nanmean(sub(s).ex(e).d(d).t_m         );
                  en(e).d(d).pa(en(e).i,:) = pix2mm2(nanmean(sub(s).ex(e).d(d).pa_m1));
                  [  en(e).d(d).max_constrict(   en(e).i ), ...
                     en(e).d(d).t_max_constrict( en(e).i ), ...
                     en(e).d(d).max_con_vel(     en(e).i ), ...
                     en(e).d(d).t_max_con_vel(   en(e).i ), ...
                     en(e).d(d).max_dil_vel(     en(e).i ), ...
                     en(e).d(d).t_max_dil_vel(   en(e).i ), ...
                     en(e).d(d).T75(             en(e).i ), ...
                     en(e).d(d).avg_con_vel(     en(e).i ), ...
                     en(e).d(d).avg_dil_vel(     en(e).i ), ...
                     en(e).d(d).min_constrict(   en(e).i ), ...
                     ] = pupil_dynamics4( nanmean(sub(s).ex(e).d(d).t_m), ...
                     pix2mm2(nanmean(sub(s).ex(e).d(d).pa_m1))  );
               end %for d
            elseif sub(s).con == 1
               ey(e).i = ey(e).i + 1;
               for d = 1:3
                  ey(e).d(d).t( ey(e).i,:) = nanmean(sub(s).ex(e).d(d).t_m         );
                  ey(e).d(d).pa(ey(e).i,:) = pix2mm2(nanmean(sub(s).ex(e).d(d).pa_m1) );

                  if ~isempty( sub(s).ex(e).d(d).max_constrict )   %was min_a
                      
                     [  ey(e).d(d).max_constrict(   ey(e).i ), ...
                        ey(e).d(d).t_max_constrict( ey(e).i ), ...
                        ey(e).d(d).max_con_vel(     ey(e).i ), ...
                        ey(e).d(d).t_max_con_vel(   ey(e).i ), ...
                        ey(e).d(d).max_dil_vel(     ey(e).i ), ...
                        ey(e).d(d).t_max_dil_vel(   ey(e).i ), ...
                        ey(e).d(d).T75(        ey(e).i ), ...
                        ey(e).d(d).avg_con_vel(     ey(e).i ), ...
                        ey(e).d(d).avg_dil_vel(     ey(e).i ), ...
                        ey(e).d(d).min_constrict(   ey(e).i ), ...
                        ] = pupil_dynamics4( nanmean(sub(s).ex(e).d(d).t_m), ...
                        pix2mm2(nanmean(sub(s).ex(e).d(d).pa_m1))  );
                  else
                     ey(e).d(d).max_constrict(   ey(e).i ) = NaN;
                     ey(e).d(d).t_max_constrict( ey(e).i ) = NaN;
                     ey(e).d(d).max_con_vel(     ey(e).i ) = NaN;
                     ey(e).d(d).t_max_con_vel(   ey(e).i ) = NaN;
                     ey(e).d(d).max_dil_vel(     ey(e).i ) = NaN;
                     ey(e).d(d).t_max_dil_vel(   ey(e).i ) = NaN;
                     ey(e).d(d).T75(             ey(e).i ) = NaN;
                     ey(e).d(d).avg_con_vel(     ey(e).i ) = NaN;
                     ey(e).d(d).avg_dil_vel(     ey(e).i ) = NaN;
                     ey(e).d(d).min_constrict(   ey(e).i ) = NaN;
                  end
               end %for d
            end


            %end %isemtpy
         end %isempty

         %keyboard
      end %for e
   end %for s
   
   % save e_data1_L en ey
   keyboard

else
   load('e_data1_L')
end

%
% Publication Figure
%

DEMO = 0;

K = 3000;

h_color(1, 1:3) = CYAN;
h_color(2, 1:3) = ORANGE;
h_color(3, 1:3) = GREEN;
h_color(4, 1:3) = DARK_CYAN;
h_color(5, 1:3) = DARK_ORANGE;
h_color(6, 1:3) = DARK_GREEN;

%%
F = 0;
for F = 1:3

    if F == 1
        h_fig = figure;
        nlp_fig_prep2(h_fig,'Portrait',2);
    end


h_axes1=axes; 
nlp_axes_prep2(h_axes1,2);
hold on
if F == 1
set(gca,'Position',   [0.5 7.0 2.5 2.5]            );     %  Left  Btm  Width Height 
xlabel('Time (s)');
title('Time Point #1 (< 72 hours post-injury');
elseif F == 2 
set(gca,'Position',   [0.5 4.0 2.5 2.5]            );     %  Left  Btm  Width Height    
else
set(gca,'Position',   [0.5 1.0 2.5 2.5]            );     %  Left  Btm  Width Height    
  
end
set(gca,'FontName',   'Arial'                      );
set(gca,'FontSize',   9                            );
set(gca,'FontWeight', 'Normal'                     );
set(gca,'xlim',       [-0.5 3.25]                  );
set(gca,'ylim',       [1 5]                        );
set(gca, 'xtick',     0:3                          );
%set(gca, 'xticklabel', {}                          );
set(gca, 'TickLabelInterpreter', 'none'            );
set(gca, 'clipping',  'off'                        );
set(gca, 'LineWidth', 1                            );

ylabel('Pupil mm')

% if ~DEMO
%    title('Time #1 (< 72 hours after injury)');
% else
%    xlabel('Time (s)');
% end

%plot( [ 0    0], [1 7],'k:','LineWidth', 0.5);
%plot( [ -0.8 3], [ 0   0],'k:','LineWidth', 0.5);

%dim
for d = F
   plot(nanmean(en(1).d(d).t(:,1:K)),nanmean(en(1).d(d).pa(:,1:K)),'k-',                      'LineWidth',.5)
   plot(nanmean(en(1).d(d).t(:,1:K)),nanmean(en(1).d(d).pa(:,1:K)),':' , 'Color',h_color(d,:),'LineWidth', 2)
   if ~DEMO
      plot(nanmean(ey(1).d(d).t(:,1:K)),nanmean(ey(1).d(d).pa(:,1:K)),'-' , 'Color',h_color(d,:),'LineWidth', 2);
   end
end
if d == 1
    plot([0.3 0.8],[4.5 4.5],'k-','LineWidth',.5); plot([0.3 0.8],[4.5 4.5],':','Color',h_color(d,:),'LineWidth',2);
    text(0.9,4.5,'Dim Control','Color',[0 0 0],'FontName','Courier New'  )

    if ~DEMO
        plot([0 0.5],[4 4],'-','Color',h_color(d,:),'LineWidth',2);
        text(0.6,4, 'Dim Concussed','Color',[0 0 0],'FontName','Courier New' )
    end
end

if d == 2

    plot([0.3 0.8],[4.5 4.5],'k-','LineWidth',.5); plot([0.3 0.8],[4.5 4.5],':','Color',h_color(d,:),'LineWidth',2);
    text(0.9,4.5,'Medium Control','Color',[0 0 0],'FontName','Courier New'  )

    if ~DEMO
        plot([0 0.5],[4 4],'-','Color',h_color(d,:),'LineWidth',2);
        text(0.6,4, 'Medium Concussed','Color',[0 0 0],'FontName','Courier New' )
    end
end

if d == 3

    plot([0.3 0.8],[4.5 4.5],'k-','LineWidth',.5); plot([0.3 0.8],[4.5 4.5],':','Color',h_color(d,:),'LineWidth',2);
    text(0.9,4.5,'Bright Control','Color',[0 0 0],'FontName','Courier New'  )

    if ~DEMO
        plot([0 0.5],[4 4],'-','Color',h_color(d,:),'LineWidth',2);
        text(0.6,4, 'Bright Concussed','Color',[0 0 0],'FontName','Courier New' )
    end

end



text(0, 1.5, ['N control   = ' num2str(size(en(1).d(1).pa,1))],'FontName','Courier New');

if ~DEMO
   text(0, 1.2, ['N concussed = ' num2str(size(ey(1).d(1).pa,1))],'FontName','Courier New');
else
   keyboard
   % print -dpdf demo_figure.pdf
end


[x,y] = m_std2polygon(nanmean(en(1).d(d).t(:,1:K)),nanmean(en(1).d(d).pa(:,1:K)), nanstd(en(1).d(d).pa(:,1:K)), h_color(d,:));
if d ==1 
[x,y] = m_std2polygon(nanmean(ey(1).d(d).t(:,1:K)),nanmean(ey(1).d(d).pa(:,1:K)), nanstd(ey(1).d(d).pa(:,1:K)), h_color(4,:));
elseif d == 2 
[x,y] = m_std2polygon(nanmean(ey(1).d(d).t(:,1:K)),nanmean(ey(1).d(d).pa(:,1:K)), nanstd(ey(1).d(d).pa(:,1:K)), h_color(5,:));
else 
[x,y] = m_std2polygon(nanmean(ey(1).d(d).t(:,1:K)),nanmean(ey(1).d(d).pa(:,1:K)), nanstd(ey(1).d(d).pa(:,1:K)), h_color(6,:));
end 
%TP2

h_axes2=axes; 
nlp_axes_prep2(h_axes2,2);
hold on
if d ==1 
set(gca,'Position',   [3.2 7.0 2.5 2.5]            );     %  Left  Btm  Width Height  
title('Time Point 2 (2-3 weeks)');
elseif d == 2 
set(gca,'Position',   [3.2 4.0 2.5 2.5]            );     %  Left  Btm  Width Height    
else
set(gca,'Position',   [3.2 1.0 2.5 2.5]            );     %  Left  Btm  Width Height    
  
end
set(gca,'FontName',   'Arial'                      );
set(gca,'FontSize',   9                            );
set(gca,'FontWeight', 'Normal'                     );
set(gca,'xlim',       [-0.5 3.25]                     );
set(gca,'ylim',       [1 5]                        );
set(gca, 'xtick',     0:3                         );
%set(gca, 'ytick',     -4:0                         );
set(gca, 'xticklabel', {}                          );
set(gca, 'yticklabel', {}                          );
set(gca, 'TickLabelInterpreter', 'none'            );
set(gca, 'clipping',  'off'                        );
set(gca, 'LineWidth', 1                            );
%xlabel('Time (s)');
%ylabel('Pupil mm')

%plot( [ 0    0], [1 7],'k:','LineWidth', 0.5);
%plot( [ -0.8 3], [ 0   0],'k:','LineWidth', 0.5);

% Interoplate the mean time to clean it up.
tt  = nanmean(en(2).d(d).t(:,1:K));
dt  = nanmean(diff(tt));
tt2 = tt(1):dt:tt(end);
tt3 = interp1(tt,tt,tt2);

for d = F
   plot(nanmean(en(2).d(d).t(:,1:K)), nanmean(en(2).d(d).pa(:,1:K)),'k-',                      'LineWidth',.5)
   plot(nanmean(en(2).d(d).t(:,1:K)), nanmean(en(2).d(d).pa(:,1:K)),':' , 'Color',h_color(d,:),'LineWidth', 2)
   plot(nanmean(en(2).d(d).t(:,1:K)), nanmean(ey(2).d(d).pa(:,1:K)),'-' , 'Color',h_color(d,:),'LineWidth', 2)
end

text(0, 1.5, ['N control   = ' num2str(size(en(2).d(1).pa,1))],'FontName','Courier New');
text(0, 1.2, ['N concussed = ' num2str(size(ey(2).d(1).pa,1))],'FontName','Courier New');

[x,y] = m_std2polygon(nanmean(en(2).d(d).t(:,1:K)),nanmean(en(2).d(d).pa(:,1:K)),  nanstd(en(2).d(d).pa(:,1:K)), h_color(d,:));
if d ==1 
[x,y] = m_std2polygon(nanmean(ey(2).d(d).t(:,1:K)),nanmean(ey(2).d(d).pa(:,1:K)), nanstd(ey(2).d(d).pa(:,1:K)), h_color(4,:));
elseif d == 2 
[x,y] = m_std2polygon(nanmean(ey(2).d(d).t(:,1:K)),nanmean(ey(2).d(d).pa(:,1:K)), nanstd(ey(2).d(d).pa(:,1:K)), h_color(5,:));
else 
[x,y] = m_std2polygon(nanmean(ey(2).d(d).t(:,1:K)),nanmean(ey(2).d(d).pa(:,1:K)), nanstd(ey(2).d(d).pa(:,1:K)), h_color(6,:));
end 

%TP3

h_axes3=axes; 
nlp_axes_prep2(h_axes3,2);
hold on
if d ==1 
set(gca,'Position',   [5.9 7.0 2.5 2.5]            );     %  Left  Btm  Width Height 
title(  'Time Point 3'        );
elseif d == 2 
set(gca,'Position',   [5.9 4.0 2.5 2.5]            );     %  Left  Btm  Width Height    
else
set(gca,'Position',   [5.9 1.0 2.5 2.5]            );     %  Left  Btm  Width Height    
  
end
set(gca,'FontName',   'Arial'                      );
set(gca,'FontSize',   9                            );
set(gca,'FontWeight', 'Normal'                     );
set(gca,'xlim',       [-0.5 3.25]                     );
set(gca,'ylim',       [1 5]                        );
%set(gca, 'xtick',     -1:4                         );
%set(gca, 'ytick',     -4:0                         );
set(gca, 'xticklabel', {}                          );
set(gca, 'yticklabel', {}                          );
set(gca, 'TickLabelInterpreter', 'none'            );
set(gca, 'clipping',  'off'                        );
set(gca, 'LineWidth', 1                            );
%title(  'Time Point #3'        );
%xlabel( 'Time (s)'             );
%ylabel( 'Normalized Pupil mm'  )


%plot( [ 0    0], [1 7],'k:','LineWidth', 0.5);
%plot( [ -0.8 3], [ 0   0],'k:','LineWidth', 0.5);

for d = F
   plot(nanmean(en(3).d(d).t(:,1:K)),nanmean(en(3).d(d).pa(:,1:K)),'k-',                      'LineWidth',.5)
   plot(nanmean(en(3).d(d).t(:,1:K)),nanmean(en(3).d(d).pa(:,1:K)),':' , 'Color',h_color(d,:),'LineWidth', 2)
   plot(nanmean(ey(3).d(d).t(:,1:K)),nanmean(ey(3).d(d).pa(:,1:K)),'-' , 'Color',h_color(d,:),'LineWidth', 2)
end


text(0, 1.5, ['N control   = ' num2str(size(en(3).d(1).pa,1))],'FontName','Courier New');
text(0, 1.2, ['N concussed = ' num2str(size(ey(3).d(1).pa,1))],'FontName','Courier New');

%Plot shaded CI Intervals

[x,y] = m_std2polygon(nanmean(en(3).d(d).t(:,1:K)),nanmean(en(3).d(d).pa(:,1:K)), nanstd(en(3).d(d).pa(:,1:K)), h_color(d,:));
if d ==1 
[x,y] = m_std2polygon(nanmean(ey(3).d(d).t(:,1:K)),nanmean(ey(3).d(d).pa(:,1:K)), nanstd(ey(3).d(d).pa(:,1:K)), h_color(4,:));
elseif d == 2 
[x,y] = m_std2polygon(nanmean(ey(3).d(d).t(:,1:K)),nanmean(ey(3).d(d).pa(:,1:K)), nanstd(ey(3).d(d).pa(:,1:K)), h_color(5,:));
else 
[x,y] = m_std2polygon(nanmean(ey(3).d(d).t(:,1:K)),nanmean(ey(3).d(d).pa(:,1:K)), nanstd(ey(3).d(d).pa(:,1:K)), h_color(6,:));
end 


end 

%%

%Create a single figure for Time Point 4


h_fig = figure; 
nlp_fig_prep2(h_fig,'Portrait',2);

% Time Point 4
%
h_axes4=axes; 
nlp_axes_prep2(h_axes4,2);
hold on
set(gca,'Position',   [0.5 6.0 3.5 3.0]            );     %  Left  Btm  Width Height                  
set(gca,'FontName',   'Arial'                      );
set(gca,'FontSize',   9                            );
set(gca,'FontWeight', 'Normal'                     );
set(gca,'xlim',       [-0.5 3.25]                     );
set(gca,'ylim',       [1 5]                        );
set(gca, 'xtick',     0:3                          );
%set(gca, 'xticklabel', {}                          );
set(gca, 'ytick',     1:7                          );
%set(gca, 'yticklabel', {}                          );
set(gca, 'TickLabelInterpreter', 'none'            );
set(gca, 'clipping',  'on'                        );
set(gca, 'LineWidth', 1                            );
title(  'Time point #4'  );
xlabel( 'Time (s)'       );
ylabel('Pupil mm')


%plot( [ 0    0], [1 7],'k:','LineWidth', 0.5);
%plot( [ -0.8 3], [ 0   0],'k:','LineWidth', 0.5);

for d = 1
   plot(nanmean(en(4).d(d).t(:,1:K)),nanmean(en(4).d(d).pa(:,1:K)),'k-',                      'LineWidth',.5)
   plot(nanmean(en(4).d(d).t(:,1:K)),nanmean(en(4).d(d).pa(:,1:K)),':' , 'Color',h_color(d,:),'LineWidth', 2)
   plot(nanmean(ey(4).d(d).t(:,1:K)),nanmean(ey(4).d(d).pa(:,1:K)),'-' , 'Color',h_color(d,:),'LineWidth', 2)
end

 plot([1.3 1.8],[4.5 4.5],'k-','LineWidth',.5); plot([1.3 1.8],[4.5 4.5],':','Color',h_color(d,:),'LineWidth',2);
    text(1.9,4.5,'Dim Control','Color',h_color(d,:),'FontName','Courier New'  )

    if ~DEMO
        plot([1.0 1.5],[4 4],'-','Color',h_color(d,:),'LineWidth',2);
        text(1.6,4, 'Dim Concussed','Color',h_color(d,:),'FontName','Courier New' )
    end

text(0, 1.5, ['N control   = ' num2str(size(en(4).d(1).pa,1))],'FontName','Courier New');
text(0, 1.2, ['N concussed = ' num2str(size(ey(4).d(1).pa,1))],'FontName','Courier New');

[x,y] = m_std2polygon(nanmean(en(4).d(d).t(:,1:K)),nanmean(en(4).d(d).pa(:,1:K)), nanstd(en(4).d(d).pa(:,1:K)), h_color(d,:));
[x,y] = m_std2polygon(nanmean(ey(4).d(d).t(:,1:K)),nanmean(ey(4).d(d).pa(:,1:K)), nanstd(ey(4).d(d).pa(:,1:K)), h_color(d,:));



h_axes2=axes; 
nlp_axes_prep2(h_axes2,2);
hold on
set(gca,'Position',   [4.4 6.0 3.5 3.0]            );     %  Left  Btm  Width Height                  
set(gca,'FontName',   'Arial'                      );
set(gca,'FontSize',   9                            );
set(gca,'FontWeight', 'Normal'                     );
set(gca,'xlim',       [-0.5 3.25]                     );
set(gca,'ylim',       [1 5]                        );
set(gca, 'xtick',     0:3                          );
%set(gca, 'ytick',     1:7                         );
set(gca, 'xticklabel', {}                          );
set(gca, 'yticklabel', {}                          );
set(gca, 'TickLabelInterpreter', 'none'            );
set(gca, 'clipping',  'on'                        );
set(gca, 'LineWidth', 1                            );

%plot( [ 0    0], [1 7],'k:','LineWidth', 0.5);
%plot( [ -0.8 3], [ 0   0],'k:','LineWidth', 0.5);

for d = 2
   plot(nanmean(en(4).d(d).t(:,1:K)),nanmean(en(4).d(d).pa(:,1:K)),'k-',                      'LineWidth',.5)
   plot(nanmean(en(4).d(d).t(:,1:K)),nanmean(en(4).d(d).pa(:,1:K)),':' , 'Color',h_color(d,:),'LineWidth', 2)
   plot(nanmean(ey(4).d(d).t(:,1:K)),nanmean(ey(4).d(d).pa(:,1:K)),'-' , 'Color',h_color(d,:),'LineWidth', 2)
end

plot([1.3 1.8],[4.5 4.5],'k-','LineWidth',.5); plot([1.3 1.8],[4.5 4.5],':','Color',h_color(d,:),'LineWidth',2);
    text(1.9,4.5,'Medium Control','Color',h_color(d,:),'FontName','Courier New'  )

    if ~DEMO
        plot([1.0 1.5],[4 4],'-','Color',h_color(d,:),'LineWidth',2);
        text(1.6,4, 'Medium Concussed','Color',h_color(d,:),'FontName','Courier New' )
    end

text(0, 1.5, ['N control   = ' num2str(size(en(4).d(1).pa,1))],'FontName','Courier New');
text(0, 1.2, ['N concussed = ' num2str(size(ey(4).d(1).pa,1))],'FontName','Courier New');

[x,y] = m_std2polygon(nanmean(en(4).d(d).t(:,1:K)),nanmean(en(4).d(d).pa(:,1:K)), nanstd(en(4).d(d).pa(:,1:K)), h_color(d,:));
[x,y] = m_std2polygon(nanmean(ey(4).d(d).t(:,1:K)),nanmean(ey(4).d(d).pa(:,1:K)), nanstd(ey(4).d(d).pa(:,1:K)), h_color(d,:));


h_axes3=axes; 
nlp_axes_prep2(h_axes3,2);
hold on
set(gca,'Position',   [0.5 2.5 3.5 3.0]            );     %  Left  Btm  Width Height                  
set(gca,'FontName',   'Arial'                      );
set(gca,'FontSize',   9                            );
set(gca,'FontWeight', 'Normal'                     );
set(gca,'xlim',       [-0.5 3.25]                     );
set(gca,'ylim',       [1 5]                        );
set(gca, 'xtick',     0:3                          );
set(gca, 'ytick',     -4:0                         );
set(gca, 'TickLabelInterpreter', 'none'            );
set(gca, 'clipping',  'on'                        );
set(gca, 'LineWidth', 1                            );

%plot( [ 0    0], [1 7],'k:','LineWidth', 0.5);
%plot( [ -0.8 3], [ 0   0],'k:','LineWidth', 0.5);

for d = 3
   plot(nanmean(en(4).d(d).t(:,1:K)),nanmean(en(4).d(d).pa(:,1:K)),'k-',                      'LineWidth',.5)
   plot(nanmean(en(4).d(d).t(:,1:K)),nanmean(en(4).d(d).pa(:,1:K)),':' , 'Color',h_color(d,:),'LineWidth', 2)
   plot(nanmean(ey(4).d(d).t(:,1:K)),nanmean(ey(4).d(d).pa(:,1:K)),'-' , 'Color',h_color(d,:),'LineWidth', 2)
end

    plot([1.3 1.8],[4.5 4.5],'k-','LineWidth',.5); plot([1.3 1.8],[4.5 4.5],':','Color',h_color(d,:),'LineWidth',2);
    text(1.9,4.5,'Bright Control','Color',h_color(d,:),'FontName','Courier New'  )

    if ~DEMO
        plot([1.0 1.5],[4 4],'-','Color',h_color(d,:),'LineWidth',2);
        text(1.6,4, 'Bright Concussed','Color',h_color(d,:),'FontName','Courier New' )
    end


text(0, 1.5, ['N control   = ' num2str(size(en(4).d(1).pa,1))],'FontName','Courier New');
text(0, 1.2, ['N concussed = ' num2str(size(ey(4).d(1).pa,1))],'FontName','Courier New');


[x,y] = m_std2polygon(nanmean(en(4).d(d).t(:,1:K)),nanmean(en(4).d(d).pa(:,1:K)), nanstd(en(4).d(d).pa(:,1:K)), h_color(d,:));
[x,y] = m_std2polygon(nanmean(ey(4).d(d).t(:,1:K)),nanmean(ey(4).d(d).pa(:,1:K)), nanstd(ey(4).d(d).pa(:,1:K)), h_color(d,:));


%%
%keyboard


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                       %
%                                       %
%  Pupil Dynamics Scatter Plots         %
%                                       %
%                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



h_fig = figure; 
nlp_fig_prep2(h_fig,'Portrait',2);

%
% First Axes - Peak Pupil Constriction
%
h_axes1=axes; 
nlp_axes_prep2(h_axes1,2);
hold on
set(gca, 'Position',   [0.75 6.0 6.0 4.0]               );     %  Left  Btm  Width Height                  
set(gca, 'FontName',   'Arial'                          );
set(gca, 'FontSize',   12                               );
set(gca, 'FontWeight', 'Normal'                         );
set(gca, 'ylim',       [0 6]                           );
set(gca, 'xlim',       [-.3 19]                         );
set(gca, 'ytick',     0:1:6                          );
set(gca, 'xtick',     [2 7 12 17]                       );
set(gca, 'xticklabel', {'<72 Hrs','2 wk','8 wk','6 mo'} );
set(gca, 'TickLabelInterpreter', 'none'                 );
set(gca, 'clipping',  'off'                             );
set(gca, 'LineWidth', 2                                 );

xlabel('Time Points');
ylabel('Minimum Pupil Constriction (mm) ')


X(1).d(1) = 1;
X(1).d(2) = 2;
X(1).d(3) = 3;


X(2).d(1) = 6;
X(2).d(2) = 7;
X(2).d(3) = 8;

X(3).d(1) = 11;
X(3).d(2) = 12;
X(3).d(3) = 13;

X(4).d(1) = 16;
X(4).d(2) = 17;
X(4).d(3) = 18;

K  = 3.5;
K2 = 0.2;

clear mdn1 mdn2 mdn3
clear an_ti
an_ti = 0;

for e = 1:4
   for d = 1:MAX_D
      % Control
      for i = 1:length(en(e).d(d).min_constrict)
         x = X(e).d(d) + ((-0.5+rand(1,1))/K) - K2;
         plot(x,en(e).d(d).min_constrict(i),'o',  'Color',h_color(d,:) );
         an_ti = an_ti + 1;
         an_t(an_ti,1:4)=[e d 0 en(e).d(d).min_constrict(i)];
      end
      if d == 1
         text(-0.05, 1,'d =');
         text(-0.05, 0.8,'auc=');
         text(-0.05, 0.6,'p =');
         text( X(e).d(d), 0.4,  ['Control   n=' num2str(size(en(e).d(d).min_constrict,2)) ],'FontName','Courier' )
         text( X(e).d(d), 0.2, ['Concussed n=' num2str(size(ey(e).d(d).min_constrict,2)) ],'FontName','Courier' ) 
      end
      
      % Concussed
      for i = 1:length(ey(e).d(d).min_constrict)
         x = X(e).d(d) + ((-0.5+rand(1,1))/K) + K2;
         plot(x,ey(e).d(d).min_constrict(i),'s',  'Color',h_color(d,:) );
         an_ti = an_ti + 1;
         an_t(an_ti,1:4)=[e d 1 ey(e).d(d).min_constrict(i)];
         
      end
      cd = meanEffectSize(en(e).d(d).min_constrict, ey(e).d(d).min_constrict,effect="Cohen"); 
      cds =  num2str(cd{1,1}, '%3.2f');
      if cd{1,1} <  0.09
         [auc, p] = rocshuf(ey(e).d(d).min_constrict,en(e).d(d).min_constrict,1000);
      else
         [auc, p] = rocshuf(en(e).d(d).min_constrict,ey(e).d(d).min_constrict,1000);
      end
      aucs = num2str(auc,'%3.2f');
      ps = num2str(p,'%3.2f');
      text( X(e).d(d), 1, cds( end-2:end), 'Color', h_color(d,:) );
      text( X(e).d(d), 0.8, aucs(end-2:end), 'Color', h_color(d,:) );
      text( X(e).d(d), 0.6, ps(  end-2:end), 'Color', h_color(d,:) );

   end %for d
   

   mdn1(e)=nanmean( en(e).d(1).min_constrict );
   mdn2(e)=nanmean( en(e).d(2).min_constrict );
   mdn3(e)=nanmean( en(e).d(3).min_constrict );
   
   mdy1(e)=nanmean( ey(e).d(1).min_constrict );
   mdy2(e)=nanmean( ey(e).d(2).min_constrict );
   mdy3(e)=nanmean( ey(e).d(3).min_constrict );

   sdn1(e)=nanstd( en(e).d(1).min_constrict );
   sdn2(e)=nanstd( en(e).d(2).min_constrict );
   sdn3(e)=nanstd( en(e).d(3).min_constrict );
   
   sdy1(e)=nanstd( ey(e).d(1).min_constrict );
   sdy2(e)=nanstd( ey(e).d(2).min_constrict );
   sdy3(e)=nanstd( ey(e).d(3).min_constrict );
   
end %for e

%text(1,-6.6,'Cohen d');

% Plot SD Bars
for i = 1:4
   plot( [X(i).d(1)-K2 X(i).d(1)-K2], [mdn1(i)-sdn1(i) mdn1(i)+sdn1(i)],'k-','Linewidth',3);
   plot( [X(i).d(1)+K2 X(i).d(1)+K2], [mdy1(i)-sdy1(i) mdy1(i)+sdy1(i)],'k-','Linewidth',3);

   plot( [X(i).d(2)-K2 X(i).d(2)-K2], [mdn2(i)-sdn2(i) mdn2(i)+sdn2(i)],'k-','Linewidth',3);
   plot( [X(i).d(2)+K2 X(i).d(2)+K2], [mdy2(i)-sdy2(i) mdy2(i)+sdy2(i)],'k-','Linewidth',3);

   plot( [X(i).d(3)-K2 X(i).d(3)-K2], [mdn3(i)-sdn3(i) mdn3(i)+sdn3(i)],'k-','Linewidth',3);
   plot( [X(i).d(3)+K2 X(i).d(3)+K2], [mdy3(i)-sdy3(i) mdy3(i)+sdy3(i)],'k-','Linewidth',3);
end

% Dim
plot( [X(1).d(1) X(2).d(1) X(3).d(1) X(4).d(1)]-K2,...
   mdn1,'-o','MarkerSize',12,'MarkerFaceColor',h_color(1,:),'MarkerEdgeColor',[0 0 0],...
   'LineWidth',2,'Color',h_color(1,:) );
plot( [X(1).d(1) X(2).d(1) X(3).d(1) X(4).d(1)]+K2,...
   mdy1,':s','MarkerSize',12,'MarkerFaceColor',h_color(1,:),'MarkerEdgeColor',[0 0 0],...
   'LineWidth',2,'Color',h_color(1,:) );

% Medium
plot( [X(1).d(2) X(2).d(2) X(3).d(2) X(4).d(2)]-K2,...
   mdn2,'-o','MarkerSize',12,'MarkerFaceColor',h_color(2,:),'MarkerEdgeColor',[0 0 0],...
   'LineWidth',2,'Color',h_color(2,:) );
plot( [X(1).d(2) X(2).d(2) X(3).d(2) X(4).d(2)]+K2,...
   mdy2,':s','MarkerSize',12,'MarkerFaceColor',h_color(2,:),'MarkerEdgeColor',[0 0 0],...
   'LineWidth',2,'Color',h_color(2,:) );

% Bright
plot( [X(1).d(3) X(2).d(3) X(3).d(3) X(4).d(3)]-K2,...
   mdn3,'-o','MarkerSize',12,'MarkerFaceColor',h_color(3,:),'MarkerEdgeColor',[0 0 0],...
   'LineWidth',2,'Color',h_color(3,:) );
plot( [X(1).d(3) X(2).d(3) X(3).d(3) X(4).d(3)]+K2,...
   mdy3,':s','MarkerSize',12,'MarkerFaceColor',h_color(3,:),'MarkerEdgeColor',[0 0 0],...
   'LineWidth',2,'Color',h_color(3,:) );



% Stats
an_t2 = array2table(an_t,'VariableNames',{'Time_Point','Brightness','Concuss','Pupil'});
mdl   = fitglm(an_t2,'Pupil ~ Concuss + Time_Point + Brightness');

text(0.5,-1,['ANOVA Concussed p = ' num2str(mdl.Coefficients{4,4},'%4.3f') '  Brigtness p = ' num2str(mdl.Coefficients{3,4},'%4.3f') '  Time Point p = ' num2str(mdl.Coefficients{2,4},'%4.3f') ],...
   'FontSize',13 );

title('Minimum Pupil Constriction')

% Key
plot(16,1.5, 'ko', 'MarkerSize', 10, 'LineWidth',2 );
plot(16,1.3, 'ks', 'MarkerSize', 10, 'LineWidth',2 );

text(16.3,1.6,'Control');
text(16.3,1.3,'Concussed');
text(16.0, 2.2,'Dim',   'Color',h_color(1,:) );
text(16.0, 2,'Medium','Color',h_color(2,:) );
text(16.0, 1.8,'Bright','Color',h_color(3,:) );



%
% Second Axes - Average Constriction Velocity
%
h_axes1=axes; 
nlp_axes_prep2(h_axes1,2);
hold on
set(gca, 'Position',   [0.75 0.90 6.0 4.0]              );     %  Left  Btm  Width Height                  
set(gca, 'FontName',   'Arial'                          );
set(gca, 'FontSize',   12                               );
set(gca, 'FontWeight', 'Normal'                         );
set(gca, 'ylim',       [-3 0]                        );
set(gca, 'xlim',       [-0.1 19]                         );
set(gca, 'ytick',      -3 : 0.5 : 0                  );
set(gca, 'xtick',     [2 7 12 17]                       );
set(gca, 'xticklabel', {'<72 Hrs','2 wk','8 wk','6 mo'} );
set(gca, 'TickLabelInterpreter', 'none'                 );
set(gca, 'clipping',  'off'                             );
set(gca, 'LineWidth', 2                                 );

xlabel('Time Points');
ylabel('Average Constriction Velocity (mm/s) ')


clear mdn1 mdn2 mdn3
clear an_ti
an_ti = 0;

for e = 1:4
   for d = 1:MAX_D
      % Control
      for i = 1:length(en(e).d(d).avg_con_vel)
         x = X(e).d(d) + ((-0.5+rand(1,1))/K) - K2;
         plot(x,en(e).d(d).avg_con_vel(i),'o',  'Color',h_color(d,:) );
         an_ti = an_ti + 1;
         an_t(an_ti,1:4)=[e d 0 en(e).d(d).avg_con_vel(i)];
      end
      if d == 1
         text(-0.05, -2.5,'d =');
         text(-0.05, -2.6,'auc=');
         text(-0.05, -2.7,'p =');
         text( X(e).d(d), -2.8, ['Control   n=' num2str(size( en(e).d(d).avg_con_vel ,2)) ],'FontName','Courier')
         text( X(e).d(d), -2.9, ['Concussed n=' num2str(size( ey(e).d(d).avg_con_vel ,2)) ],'FontName','Courier' ) 
      end
      
      % Concussed
      for i = 1:length(ey(e).d(d).avg_con_vel)
         x = X(e).d(d) + ((-0.5+rand(1,1))/K) + K2;
         plot(x, ey(e).d(d).avg_con_vel(i), 's',  'Color',h_color(d,:) );
         an_ti = an_ti + 1;
         an_t(an_ti,1:4)=[e d 1 ey(e).d(d).avg_con_vel(i)];
         
      end
      cd = meanEffectSize(en(e).d(d).avg_con_vel, ey(e).d(d).avg_con_vel,effect="Cohen"); 
      %cd = computeCohen_d(en(e).d(d).avg_con_vel, ey(e).d(d).avg_con_vel, 'independent');
      if cd{1,1} <  0.09
         [auc, p] = rocshuf(ey(e).d(d).avg_con_vel, en(e).d(d).avg_con_vel,1000);
      else
         [auc, p] = rocshuf(en(e).d(d).avg_con_vel, ey(e).d(d).avg_con_vel,1000);
      end
      cds  = num2str(cd{1,1}, '%3.2f');
      aucs = num2str(auc,'%3.2f');
      ps   = num2str(p,  '%3.2f');

      text( X(e).d(d), -2.5, cds(end-2:end),  'Color', h_color(d,:) );
      text( X(e).d(d), -2.6, aucs(end-2:end), 'Color', h_color(d,:) );
      text( X(e).d(d), -2.7, ps(  end-2:end), 'Color', h_color(d,:) );
      
   end %for d
   
   mdn1(e)=nanmean( en(e).d(1).avg_con_vel );
   mdn2(e)=nanmean( en(e).d(2).avg_con_vel );
   mdn3(e)=nanmean( en(e).d(3).avg_con_vel );
   
   mdy1(e)=nanmean( ey(e).d(1).avg_con_vel );
   mdy2(e)=nanmean( ey(e).d(2).avg_con_vel );
   mdy3(e)=nanmean( ey(e).d(3).avg_con_vel );

   sdn1(e)=nanstd( en(e).d(1).avg_con_vel );
   sdn2(e)=nanstd( en(e).d(2).avg_con_vel );
   sdn3(e)=nanstd( en(e).d(3).avg_con_vel );
   
   sdy1(e)=nanstd( ey(e).d(1).avg_con_vel );
   sdy2(e)=nanstd( ey(e).d(2).avg_con_vel );
   sdy3(e)=nanstd( ey(e).d(3).avg_con_vel );
   
end %for e

% Plot SD Bars
for i = 1:4
   plot( [X(i).d(1)-K2 X(i).d(1)-K2], [mdn1(i)-sdn1(i) mdn1(i)+sdn1(i)],'k-','Linewidth',3);
   plot( [X(i).d(1)+K2 X(i).d(1)+K2], [mdy1(i)-sdy1(i) mdy1(i)+sdy1(i)],'k-','Linewidth',3);

   plot( [X(i).d(2)-K2 X(i).d(2)-K2], [mdn2(i)-sdn2(i) mdn2(i)+sdn2(i)],'k-','Linewidth',3);
   plot( [X(i).d(2)+K2 X(i).d(2)+K2], [mdy2(i)-sdy2(i) mdy2(i)+sdy2(i)],'k-','Linewidth',3);

   plot( [X(i).d(3)-K2 X(i).d(3)-K2], [mdn3(i)-sdn3(i) mdn3(i)+sdn3(i)],'k-','Linewidth',3);
   plot( [X(i).d(3)+K2 X(i).d(3)+K2], [mdy3(i)-sdy3(i) mdy3(i)+sdy3(i)],'k-','Linewidth',3);
end

%text(1,0.77,'Cohen d');

% Dim
plot( [X(1).d(1) X(2).d(1) X(3).d(1) X(4).d(1)]-K2,...
   mdn1,'-o','MarkerSize',12,'MarkerFaceColor',h_color(1,:),'MarkerEdgeColor',[0 0 0],...
   'LineWidth',2,'Color',h_color(1,:) );
plot( [X(1).d(1) X(2).d(1) X(3).d(1) X(4).d(1)]+K2,...
   mdy1,':s','MarkerSize',12,'MarkerFaceColor',h_color(1,:),'MarkerEdgeColor',[0 0 0],...
   'LineWidth',2,'Color',h_color(1,:) );

% Medium
plot( [X(1).d(2) X(2).d(2) X(3).d(2) X(4).d(2)]-K2,...
   mdn2,'-o','MarkerSize',12,'MarkerFaceColor',h_color(2,:),'MarkerEdgeColor',[0 0 0],...
   'LineWidth',2,'Color',h_color(2,:) );
plot( [X(1).d(2) X(2).d(2) X(3).d(2) X(4).d(2)]+K2,...
   mdy2,':s','MarkerSize',12,'MarkerFaceColor',h_color(2,:),'MarkerEdgeColor',[0 0 0],...
   'LineWidth',2,'Color',h_color(2,:) );

% Bright
plot( [X(1).d(3) X(2).d(3) X(3).d(3) X(4).d(3)]-K2,...
   mdn3,'-o','MarkerSize',12,'MarkerFaceColor',h_color(3,:),'MarkerEdgeColor',[0 0 0],...
   'LineWidth',2,'Color',h_color(3,:) );
plot( [X(1).d(3) X(2).d(3) X(3).d(3) X(4).d(3)]+K2,...
   mdy3,':s','MarkerSize',12,'MarkerFaceColor',h_color(3,:),'MarkerEdgeColor',[0 0 0],...
   'LineWidth',2,'Color',h_color(3,:) );



% Stats
an_t2 = array2table(an_t,'VariableNames',{'Time_Point','Brightness','Concuss','Pupil'});
mdl   = fitglm(an_t2,'Pupil ~ Concuss + Time_Point + Brightness');

text(0.5,-3.5,['ANOVA: Concussed p=' num2str(mdl.Coefficients{4,4},'%4.3f') '  Brigtness p =' num2str(mdl.Coefficients{3,4},'%4.3f') '  Time Point p =' num2str(mdl.Coefficients{2,4},'%4.3f') ],...
   'FontSize',13 );

title('Average Constriction Velocity')



% Key
plot(16.3, -2.2, 'ko', 'MarkerSize', 10, 'LineWidth',2 );
plot(16.3, -2.3, 'ks', 'MarkerSize', 10, 'LineWidth',2 );
text(16.7, -2.2, 'Control');
text(16.7, -2.3, 'Concussed');

text(16.3, -1.8,'Dim',   'Color',h_color(1,:) );
text(16.3, -1.9,'Medium','Color',h_color(2,:) );
text(16.3, -2,'Bright','Color',h_color(3,:) );


%Time Point 1 table

%i = 1;
%t = 1;
% Make stats table
%for i = 1:3

for i = 1:4
   d2(i).stats{1,1} = 'Dim';
   d2(i).stats{2,1} = 'Medium';
   d2(i).stats{3,1} = 'Bright';
    for j = 1:3
        d2(i).stats{j,2} = nanmean( ey(i).d(j).max_constrict );
        d2(i).stats{j,3} = nanstd(  ey(i).d(j).max_constrict );
        d2(i).stats{j,4} = nanmean( en(i).d(j).max_constrict );
        d2(i).stats{j,5} = nanstd(  en(i).d(j).max_constrict );
        effectsize = meanEffectSize(en(i).d(j).max_constrict, ey(i).d(j).max_constrict, effect="Cohen");
        d2(i).stats{j,6} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey(i).d(j).max_constrict,en(i).d(j).max_constrict,1000);
        else
            [auc, p] = rocshuf(en(i).d(j).max_constrict,ey(i).d(j).max_constrict,1000);
        end
        d2(i).stats{j,7} = num2str(auc,'%3.2f');

        d2(i).stats{j,8} = nanmean(  ey(i).d(j).t_max_constrict );
        d2(i).stats{j,9} = nanstd(   ey(i).d(j).t_max_constrict );
        d2(i).stats{j,10} = nanmean( en(i).d(j).t_max_constrict );
        d2(i).stats{j,11} = nanstd(  en(i).d(j).t_max_constrict );
        effectsize = meanEffectSize( en(i).d(j).t_max_constrict, ey(i).d(j).t_max_constrict, effect="Cohen");
        d2(i).stats{j,12} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0.09
            [auc, p] = rocshuf(ey(i).d(j).t_max_constrict,en(i).d(j).t_max_constrict,1000);
        else
            [auc, p] = rocshuf(en(i).d(j).t_max_constrict,ey(i).d(j).t_max_constrict,1000);
        end
        d2(i).stats{j,13} = num2str(auc,'%3.2f');

        d2(i).stats{j,14} = nanmean( ey(i).d(j).max_con_vel );
        d2(i).stats{j,15} = nanstd( ey(i).d(j).max_con_vel );
        d2(i).stats{j,16} = nanmean( en(i).d(j).max_con_vel );
        d2(i).stats{j,17} = nanstd( en(i).d(j).max_con_vel );
        effectsize = meanEffectSize(en(i).d(j).max_con_vel, ey(i).d(j).max_con_vel, effect="Cohen");
        d2(i).stats{j,18} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey(i).d(j).max_con_vel,en(i).d(j).max_con_vel,1000);
        else
            [auc, p] = rocshuf(en(i).d(j).max_con_vel,ey(i).d(j).max_con_vel,1000);
        end
        d2(i).stats{j,19} = num2str(auc,'%3.2f');

        d2(i).stats{j,20} = nanmean( ey(i).d(j).t_max_con_vel );
        d2(i).stats{j,21} = nanstd( ey(i).d(j).t_max_con_vel );
        d2(i).stats{j,22} = nanmean( en(i).d(j).t_max_con_vel );
        d2(i).stats{j,23} = nanstd( en(i).d(j).t_max_con_vel );
        effectsize = meanEffectSize(en(i).d(j).t_max_con_vel, ey(i).d(j).t_max_con_vel, effect="Cohen");
        d2(i).stats{j,24} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0.08
            [auc, p] = rocshuf(ey(i).d(j).t_max_con_vel,en(i).d(j).t_max_con_vel,1000);
        else
            [auc, p] = rocshuf(en(i).d(j).t_max_con_vel,ey(i).d(j).t_max_con_vel,1000);
        end
        d2(i).stats{j,25} = num2str(auc,'%3.2f');

        d2(i).stats{j,26} = nanmean( ey(i).d(j).max_dil_vel );
        d2(i).stats{j,27} = nanstd( ey(i).d(j).max_dil_vel );
        d2(i).stats{j,28} = nanmean( en(i).d(j).max_dil_vel );
        d2(i).stats{j,29} = nanstd( en(i).d(j).max_dil_vel );
        effectsize = meanEffectSize(en(i).d(j).max_dil_vel, ey(i).d(j).max_dil_vel, effect="Cohen");
        d2(i).stats{j,30} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey(i).d(j).max_dil_vel,en(i).d(j).max_dil_vel,1000);
        else
            [auc, p] = rocshuf(en(i).d(j).max_dil_vel,ey(i).d(j).max_dil_vel,1000);
        end
        d2(i).stats{j,31} = num2str(auc,'%3.2f');

        d2(i).stats{j,32} = nanmean( ey(i).d(j).t_max_dil_vel );
        d2(i).stats{j,33} = nanstd( ey(i).d(j).t_max_dil_vel );
        d2(i).stats{j,34} = nanmean( en(i).d(j).t_max_dil_vel );
        d2(i).stats{j,35} = nanstd( en(i).d(j).t_max_dil_vel );
        effectsize = meanEffectSize(en(i).d(j).t_max_dil_vel, ey(i).d(j).t_max_dil_vel, effect="Cohen");
        d2(i).stats{j,36} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey(i).d(j).t_max_dil_vel,en(i).d(j).t_max_dil_vel,1000);
        else
            [auc, p] = rocshuf(en(i).d(j).t_max_dil_vel,ey(i).d(j).t_max_dil_vel,1000);
        end
        d2(i).stats{j,37} = num2str(auc,'%3.2f');

        d2(i).stats{j,38} = nanmean( ey(i).d(j).T75 );
        d2(i).stats{j,39} = nanstd( ey(i).d(j).T75 );
        d2(i).stats{j,40} = nanmean( en(i).d(j).T75);
        d2(i).stats{j,41} = nanstd( en(i).d(j).T75 );
        effectsize = meanEffectSize(en(i).d(j).T75, ey(i).d(j).T75, effect="Cohen");
        d2(i).stats{j,42} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey(i).d(j).T75,en(i).d(j).T75,1000);
        else
            [auc, p] = rocshuf(en(i).d(j).T75,ey(i).d(j).T75,1000);
        end
        d2(i).stats{j,43} = num2str(auc,'%3.2f');

        d2(i).stats{j,44} = nanmean( ey(i).d(j).avg_con_vel );
        d2(i).stats{j,45} = nanstd( ey(i).d(j).avg_con_vel );
        d2(i).stats{j,46} = nanmean( en(i).d(j).avg_con_vel );
        d2(i).stats{j,47} = nanstd( en(i).d(j).avg_con_vel );
        effectsize = meanEffectSize(en(i).d(j).avg_con_vel, ey(i).d(j).avg_con_vel, effect="Cohen");
        d2(i).stats{j,48} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey(i).d(j).avg_con_vel,en(i).d(j).avg_con_vel,1000);
        else
            [auc, p] = rocshuf(en(i).d(j).avg_con_vel,ey(i).d(j).avg_con_vel,1000);
        end
        d2(i).stats{j,49} = num2str(auc,'%3.2f');

        d2(i).stats{j,50} = nanmean( ey(i).d(j).avg_dil_vel );
        d2(i).stats{j,51} = nanstd( ey(i).d(j).avg_dil_vel );
        d2(i).stats{j,52} = nanmean( en(i).d(j).avg_dil_vel );
        d2(i).stats{j,53} = nanstd( en(i).d(j).avg_dil_vel );
        effectsize = meanEffectSize(en(i).d(j).avg_dil_vel, ey(i).d(j).avg_dil_vel, effect="Cohen");
        d2(i).stats{j,54} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey(i).d(j).avg_dil_vel,en(i).d(j).avg_dil_vel,1000);
        else
            [auc, p] = rocshuf(en(i).d(j).avg_dil_vel,ey(i).d(j).avg_dil_vel,1000);
        end
        d2(i).stats{j,55} = num2str(auc,'%3.2f');

        d2(i).stats{j,56} = nanmean( ey(i).d(j).min_constrict );
        d2(i).stats{j,57} = nanstd( ey(i).d(j).min_constrict );
        d2(i).stats{j,58} = nanmean( en(i).d(j).min_constrict );
        d2(i).stats{j,59} = nanstd( en(i).d(j).min_constrict );
        effectsize = meanEffectSize(en(i).d(j).min_constrict, ey(i).d(j).min_constrict, effect="Cohen");
        d2(i).stats{j,60} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey(i).d(j).min_constrict,en(i).d(j).min_constrict,1000);
        else
            [auc, p] = rocshuf(en(i).d(j).min_constrict,ey(i).d(j).min_constrict,1000);
        end
        d2(i).stats{j,61} = num2str(auc,'%3.2f');


    end %for j


d2(i).stats_table = array2table(d2(i).stats,'VariableNames',{'Light' 'max_constrict_y' 'max_constrict_y_std' 'max_constrict_n' 'max_constrict_n_std' 'max_constrict_effectsize' 'max_constrict_auc' 't_to_max_constrict_y'  ... 
   't_to_max_constrict_y_std' 't_to_max_constrict_n' 't_to_max_constrict_n_std' 't_to_max_constrict_effectsize' 't_to_max_constrict_auc' 'max_con_vel_y' 'max_con_vel_y_std' 'max_con_vel_n' 'max_con_vel_n_std' 'max_con_vel_effectsize' 'max_con_vel_auc' ...
   't_to_max_con_vel_y' 't_to_max_con_vel_y_std' 't_to_max_con_vel_n' 't_to_max_con_vel_n_std' 't_to_max_con_vel_effectsize' 't_to_max_con_vel_auc' 'max_dil_vel_y' 'max_dil_vel_y_std' 'max_dil_vel_n' 'max_dil_vel_n_std' 'max_dil_vel_effectsize' 'max_dil_vel_auc' ...
   't_to_max_dil_vel_y' 't_to_max_dil_vel_y_std' 't_to_max_dil_vel_n' 't_to_max_dil_vel_n_std' 't_to_max_dil_vel_effectsize' 't_to_max_dil_vel_auc' 'T75_y' 'T75_y_std' 'T75_n' 'T75_n_std' 'T75_effectsize' 'T75_auc' 'avg_con_vel_y' 'avg_con_vel_y_std' 'avg_con_vel_n'...
   'avg_con_vel_n_std' 'avg_con_vel_effectsize' 'avg_con_vel_auc' 'avg_dil_vel_y' 'avg_dil_vel_y_std' 'avg_dil_vel_n' 'avg_dil_vel_n_std' 'avg_dil_vel_effectsize' 'avg_dil_vel_auc' 'min_constrict_y' 'min_constrict_y_std' 'min_constrict_n' 'min_constrict_n_std' 'min_constrict_effectsize' 'min_constrict_auc'} );



end %for i

%end

 Stats_Table_Export

table_exportL = array2table(ex_table)
writecell(table_exportL.ex_table1.stats, 'L_table.csv')

%}

% fini




