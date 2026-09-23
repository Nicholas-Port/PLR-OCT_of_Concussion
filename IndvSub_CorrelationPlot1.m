%Individual Correlation Plots

colors(2,1:3)=ORANGE;
colors(1,1:3)=CYAN;

hf1 = figure;
hf2 = figure;
hf3 = figure;
hf4 = figure;
nlp_fig_prep(hf1, 'Portrait');
nlp_fig_prep(hf2, 'Portrait');
nlp_fig_prep(hf3, 'Portrait');
nlp_fig_prep(hf4, 'Portrait');

col= [0.61 3.26 5.96];
row= [7 4 1];

for i = 1:10

  switch i
        case {1, 2}
            figure(hf1)
        case {3, 4, 5}
            figure(hf2)
        case {6 ,7, 9}
            figure(hf3)
        case {8, 10}
            figure(hf4)
   end

   %to get row
   switch i

        case {1, 3, 6, 8}
            r = 1;
        case  {2, 4, 7, 10}
            r = 2;
        case { 5, 9}
            r = 3;
   end


   for j = 1:3
      ha = axes;
      nlp_axes_prep(ha);
      hold on
      xlabel('Trial 1');
      ylabel('Trials 2-8');
      set(gca,'FontSize', 12            );


      if j == 1
         set(gca,'Position',[col(j) row(r) 2.2 2.2]   ); % gca = graphical current axes % left bottom width height
        switch i
             case {1}
                 text(1,6.5,'Dim');
             case {2}
                 text(0.8,1.7,'Dim');
             case {3}
                 text(-4.5,-1.5,'Dim');
             case {4}
                 text(0.05,0.5,'Dim');
             case {5}
                 text(0.2,2.8,'Dim');
             case {6}
                 text(1.3,3,'Dim');
             case {7}
                 text(.7,1.7,'Dim');
             case {8}
                 text(-2.8,-0.3,'Dim');
             case {9}
                 text(0.25,1.8,'Dim');
             case {10}
                 text(0.5,5.5,'Dim');
         end

      elseif j == 2
         set(gca,'Position',[col(j) row(r) 2.2 2.2]   );
         set(gca, 'yticklabel', {}            );
          switch i
             case {1}
                 text(1,6.5,'Medium');
             case {2}
                 text(0.8,1.7,'Medium');
             case {3}
                 text(-4.5,-1.5,'Medium');
             case {4}
                 text(0.05,0.5,'Medium');
             case {5}
                 text(0.2,2.8,'Medium');
             case {6}
                 text(1.3,3,'Medium');
             case {7}
                 text(.7,1.7,'Medium');
             case {8}
                 text(-2.8,-0.3,'Medium');
             case {9}
                 text(0.25,1.8,'Medium');
             case {10}
                 text(0.5,5.5,'Medium');
         end

      else
         set(gca,'Position',[col(j) row(r) 2.2 2.2]   );
         set(gca, 'yticklabel', {}            );
          switch i
             case {1}
                 text(1,6.5,'Bright');
             case {2}
                 text(0.8,1.7,'Bright');
             case {3}
                 text(-4.5,-1.5,'Bright');
             case {4}
                 text(0.05,0.5,'Bright');
             case {5}
                 text(0.2,2.8,'Bright');
             case {6}
                 text(1.3,3,'Bright');
             case {7}
                 text(.7,1.7,'Bright');
             case {8}
                 text(-2.8,-0.3,'Bright');
             case {9}
                 text(0.25,1.8,'Bright');
             case {10}
                 text(0.5,5.5,'Bright');
         end

      end



      row_i = 0;
      row_j = 0;
      clear r1 p1 r2 p2 x1 y1 x2 y2
      clear  store_Corr_control1 store_Corr_control2 store_Corr_concuss1 store_Corr_concuss2

      t_cell{1}='max_constrict';
      t_cell{2}='t_max_constrict';
      t_cell{3}='max_con_vel';
      t_cell{4}='t_max_con_vel';
      t_cell{5}='max_dil_vel';
      t_cell{6}='t_max_dil_vel';
      t_cell{7}='T75';
      t_cell{8}='avg_con_vel';
      t_cell{9}='avg_dil_vel';
      t_cell{10}='min_constrict';

      for s = 1:length(sub)
         for e = 1:1 %length(sub(s).ex)

            if ~isempty(sub(s).ex(e).d)
               if ~isempty(sub(s).ex(e).d(j).tr)


                  if sub(s).con == 0

                     % Find the starting trial
                     for t = 1:length(sub(s).ex(e).d(j).tr)
                        if sub(s).ex(e).d(j).tr(t).ok == 1 & ...
                              ~isempty(sub(s).ex(e).d(j).tr(t).ok)
                           t1 = t;
                           break;
                        end
                     end %t
                     % Now process all the rest of the
                     % trials
                     for t = t1+1:length(sub(s).ex(e).d(j).tr)
                        if sub(s).ex(e).d(j).tr(t).ok == 1 & ...
                              ~isempty(sub(s).ex(e).d(j).tr(t).ok)
                           row_i = row_i + 1;
                           eval(['x1(row_i,1) = sub(s).ex(e).d(j).tr(t1).' t_cell{i} ';']); %max_constrict;
                           eval(['y1(row_i,1) = sub(s).ex(e).d(j).tr(t).'  t_cell{i} ';']); %max_constrict;

                           
                        end %if
                     end %t

                  elseif sub(s).con == 1
                     % Find the starting trial
                     for t = 1:length(sub(s).ex(e).d(j).tr)
                        if sub(s).ex(e).d(j).tr(t).ok == 1 & ...
                              ~isempty(sub(s).ex(e).d(j).tr(t).ok)
                           t1 = t;
                           break;
                        end
                     end %t
                     % Now process all the rest of the
                     % trials
                     for t = t1+1:length(sub(s).ex(e).d(j).tr)
                        if sub(s).ex(e).d(j).tr(t).ok == 1 & ...
                              ~isempty(sub(s).ex(e).d(j).tr(t).ok)
                           row_j = row_j + 1;
                           eval(['x2(row_j,1) = sub(s).ex(e).d(j).tr(t1).' t_cell{i} ';']); %max_constrict;
                           eval(['y2(row_j,1) = sub(s).ex(e).d(j).tr(t).'  t_cell{i} ';']); %max_constrict;
                        end %if
                     end %t

                  end %concussed or control

               end % isempty trial
            end % isempty file
         end %e
      end %for s


      hs1 = scatter(x1,y1);
      hs2 = scatter(x2,y2);
      set(hs1,'CData',colors(1,:),'MarkerEdgeAlpha',0.3,'LineWidth',2   );
      set(hs2,'CData',colors(2,:),'MarkerEdgeAlpha',0.3,'LineWidth',2   );

      [r1, p1]=corr(x1,y1,'rows', 'complete');
      [r2, p2]=corr(x2,y2,'rows', 'complete'  );

      %ICC: absolute agreement, single measurement
      data1 = [x1 y1];
      data1 = data1(all(~isnan(data1),2),:);

      data2 = [x2 y2];
      data2 = data2(all(~isnan(data2),2),:);

      [icc1, LB1, UB1, F1, df1_1, df2_1, pICC1] = ...
          ICC(data1,'A-1',0.05,0);

      [icc2, LB2, UB2, F2, df1_2, df2_2, pICC2] = ...
          ICC(data2,'A-1',0.05,0);

      switch i

         case 1
            set(gca,'xlim',      [0.5 7]       );
            set(gca,'ylim',      [0.5 7]       );
            h_x=get(gca,'xlim');
            h_y=get(gca,'ylim');
            plot([h_x(1) h_x(2)], [h_y(1) h_y(2)], 'k:','Linewidth',0.5)
            title('Max Constriction (mm)')
            if j == 1
               text(0.5,6.0,['Control n =' num2str(length(x1))],  'FontName', 'Courier' ,'Color',colors(1,:));
               text(0.5,5,['Concussed n =' num2str(length(x2))],  'FontName', 'Courier' ,'Color',colors(2,:));
               text(0.5,5.5,[' \itr= ' num2str(r1,'%3.2f')  ' p=' num2str(p1,'%4.3f') ' ICC= ' num2str(icc1,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(1,:));
               text(0.5,4.5,[' \itr= ' num2str(r2,'%3.2f')  ' p=' num2str(p2,'%4.3f') ' ICC= ' num2str(icc2,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(2,:));
            else
               text(0.5,6.0,[' \itr= ' num2str(r1,'%3.2f')  ' p=' num2str(p1,'%4.3f') ' ICC= ' num2str(icc1,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(1,:));
               text(0.5,5.5,[' \itr= ' num2str(r2,'%3.2f')  ' p=' num2str(p2,'%4.3f') ' ICC= ' num2str(icc2,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(2,:));
            end
         case 2
            set(gca,'xlim',      [0.6 1.8]       );
            set(gca,'ylim',      [0.6 1.8]       );
            h_x=get(gca,'xlim');
            h_y=get(gca,'ylim');
            plot([h_x(1) h_x(2)], [h_y(1) h_y(2)], 'k:','Linewidth',0.5)
            title('Time to Max Constriction (s)')
            text(.6,1.6,['\itr= ' num2str(r1,'%3.2f')  ' p=' num2str(p1,'%4.3f') ' ICC= ' num2str(icc1,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(1,:));
            text(.6,1.5,['\itr= '   num2str(r2,'%3.2f')  ' p=' num2str(p2,'%4.3f') ' ICC= ' num2str(icc2,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(2,:));
         case 3
             set(gca,'xlim',      [-6 -1]       );
             set(gca,'ylim',      [-6 -1]       );
             h_x=get(gca,'xlim');
             h_y=get(gca,'ylim');
             plot([h_x(1) h_x(2)], [h_y(1) h_y(2)], 'k:','Linewidth',0.5)
            title('Max Constrict Velocity (mm/s)')
            text(-6,-5,['Control n =' num2str(length(x1))],  'FontName', 'Courier' ,'Color',colors(1,:));
            text(-6,-5.5,['Concussed n =' num2str(length(x2))],  'FontName', 'Courier' ,'Color',colors(2,:));
            text(-6,-5.2,[' \itr= ' num2str(r1,'%3.2f')  ' p=' num2str(p1,'%4.3f') ' ICC= ' num2str(icc1,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(1,:));
            text(-6,-5.8,[' \itr= ' num2str(r2,'%3.2f')  ' p=' num2str(p2,'%4.3f') ' ICC= ' num2str(icc2,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(2,:));
         case 4 %
            set(gca,'xlim',      [0 0.55]       );
            set(gca,'ylim',      [0 0.55]       );
            h_x=get(gca,'xlim');
            h_y=get(gca,'ylim');
            plot([h_x(1) h_x(2)], [h_y(1) h_y(2)], 'k:','Linewidth',0.5)
            title('Time to Max Constrict Velocity(s)')
            text(0,.15,['\itr= ' num2str(r1,'%3.2f')  ' p=' num2str(p1,'%4.3f') ' ICC= ' num2str(icc1,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(1,:));
            text(0,.10,['\itr= ' num2str(r2,'%3.2f')  ' p=' num2str(p2,'%4.3f') ' ICC= ' num2str(icc2,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(2,:));
         case 5 %
            set(gca,'xlim',      [0 3]       );
            set(gca,'ylim',      [0 3]       );
            h_x=get(gca,'xlim');
            h_y=get(gca,'ylim');
            plot([h_x(1) h_x(2)], [h_y(1) h_y(2)], 'k:','Linewidth',0.5)
            title('Max Dilation Velocity (mm/s)')
            text(0,.5,['\itr= ' num2str(r1,'%3.2f')  ' p=' num2str(p1,'%4.3f') ' ICC= ' num2str(icc1,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(1,:));
            text(0,.2,['\itr= '  num2str(r2,'%3.2f')  ' p=' num2str(p2,'%4.3f') ' ICC= ' num2str(icc2,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(2,:));
         case 6 %
            set(gca,'xlim',      [1 3.2]       );
            set(gca,'ylim',      [1 3.2]       );
            h_x=get(gca,'xlim');
            h_y=get(gca,'ylim');
            plot([h_x(1) h_x(2)], [h_y(1) h_y(2)], 'k:','Linewidth',0.5)
            title('Time to Max Dilation Velocity (s)')
            text(1,2.8,['Control n =' num2str(length(x1))],  'FontName', 'Courier' ,'Color',colors(1,:));
            text(1,2.5,['Concussed n =' num2str(length(x2))],  'FontName', 'Courier' ,'Color',colors(2,:));
             text(1,2.65,[' \itr= ' num2str(r1,'%3.2f')  ' p=' num2str(p1,'%4.3f') ' ICC= ' num2str(icc1,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(1,:));
            text(1,2.35,[' \itr= '   num2str(r2,'%3.2f')  ' p=' num2str(p2,'%4.3f') ' ICC= ' num2str(icc2,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(2,:));
         case 7
            set(gca,'xlim',      [0.6 1.8]       );
            set(gca,'ylim',      [0.6 1.8]       );
            h_x=get(gca,'xlim');
            h_y=get(gca,'ylim');
            plot([h_x(1) h_x(2)], [h_y(1) h_y(2)], 'k:','Linewidth',0.5)
            title('T75 (s)')
            text(.6,1.6,['\itr= ' num2str(r1,'%3.2f')  ' p=' num2str(p1,'%4.3f') ' ICC= ' num2str(icc1,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(1,:));
            text(.6,1.5,['\itr= '   num2str(r2,'%3.2f')  ' p=' num2str(p2,'%4.3f') ' ICC= ' num2str(icc2,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(2,:));
         case 8 % 
            set(gca,'xlim',      [-3 0]       );
            set(gca,'ylim',      [-3 0]       );
            h_x=get(gca,'xlim');
            h_y=get(gca,'ylim');
            plot([h_x(1) h_x(2)], [h_y(1) h_y(2)], 'k:','Linewidth',0.5)
            title('Avg Constriction Velocity (mm/s)')
            text(-3,-2.45,['Control n =' num2str(length(x1))],  'FontName', 'Courier' ,'Color',colors(1,:));
            text(-3,-2.75,['Concussed n =' num2str(length(x2))],  'FontName', 'Courier' ,'Color',colors(2,:));
            text(-3,-2.6,[' \itr= ' num2str(r1,'%3.2f')  ' p=' num2str(p1,'%4.3f') ' ICC= ' num2str(icc1,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(1,:));
            text(-3,-2.9,[' \itr= '   num2str(r2,'%3.2f')  ' p=' num2str(p2,'%4.3f') ' ICC= ' num2str(icc2,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(2,:));
         case 9 % 
             set(gca,'xlim',      [0 2]       );
             set(gca,'ylim',      [0 2]       );
             h_x=get(gca,'xlim');
             h_y=get(gca,'ylim');
             plot([h_x(1) h_x(2)], [h_y(1) h_y(2)], 'k:','Linewidth',0.5)
             title('Avg Dilation Velocity (mm/s)')
             text(0,1.6, ['\itr= ' num2str(r1,'%3.2f')  ' p=' num2str(p1,'%4.3f') ' ICC= ' num2str(icc1,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(1,:));
             text(0,1.5,['\itr= '  num2str(r2,'%3.2f')  ' p=' num2str(p2,'%4.3f') ' ICC= ' num2str(icc2,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(2,:));
          case 10
              set(gca,'xlim',      [0 6]       );
              set(gca,'ylim',      [0 6]       );
              h_x=get(gca,'xlim');
              h_y=get(gca,'ylim');
              plot([h_x(1) h_x(2)], [h_y(1) h_y(2)], 'k:','Linewidth',0.5)
              title('Minimum Constriction (mm)')
              text(0,1,['\itr= ' num2str(r1,'%3.2f')  ' p=' num2str(p1,'%4.3f') ' ICC= ' num2str(icc1,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(1,:));
              text(0,0.5,['\itr= '  num2str(r2,'%3.2f')  ' p=' num2str(p2,'%4.3f') ' ICC= ' num2str(icc2,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(2,:));
      end %switch
   end %for j (different trial types: dim, medium, bright


end %for i  (different axes loop)