%Plots for correlations

colors(1,1:3)=ORANGE;
colors(2,1:3)=CYAN;

hf1 = figure;
hf2 = figure;
hf3 = figure;
hf4 = figure;
nlp_fig_prep(hf1, 'Portrait');
nlp_fig_prep(hf2, 'Portrait');
nlp_fig_prep(hf3, 'Portrait');
nlp_fig_prep(hf4, 'Portrait');

col= [0.65 3.3 6];
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
      xlabel('Timepoint 1');
      ylabel('Timepoint 2');
      set(gca,'FontSize', 12            );
      axis equal
      if j == 1
         set(gca,'Position',[col(j) row(r) 2.2 2.2]   ); % gca = graphical current axes % left bottom width height
         switch i
             case {1}
                 text(1,6.5,'Dim');
             case {2}
                 text(0.8,1.7,'Dim');
             case {3}
                 text(-6.5,-0.5,'Dim');
             case {4}
                 text(0.05,0.5,'Dim');
             case {5}
                 text(0.2,2.8,'Dim');
             case {6}
                 text(1.3,2.1,'Dim');
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
                 text(-6.5,-0.5,'Medium');
             case {4}
                 text(0.05,0.5,'Medium');
             case {5}
                 text(0.2,2.8,'Medium');
             case {6}
                 text(1.3,2.1,'Medium');
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
                 text(-6.5,-0.5,'Bright');
             case {4}
                 text(0.05,0.5,'Bright');
             case {5}
                 text(0.2,2.8,'Bright');
             case {6}
                 text(1.3,2.1,'Bright');
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
      set(gca,'FontSize', 12            );


      s1 = 0;
      s2 = 0;
      clear r1 p1 r2 p2
      clear  store_Corr_control1 store_Corr_control2 store_Corr_concuss1 store_Corr_concuss2
      
      x = NaN(50,2);
      y = NaN(50,2);
      for s = 1:length(sub)
         if ~isempty(sub(s).ex(1).d) & ~isempty(sub(s).ex(2).d)

            c2 =  sub(s).con + 1; %control = 1, concussed = 2
            if sub(s).con == 0
               s1 = s1 + 1;
               t_row = s1;
            elseif sub(s).con == 1
               s2 = s2 + 1;
               t_row = s2;
            end

            switch i
               case 1
                  x(t_row,c2) = sub(s).ex(1).d(j).max_constrict;
                  y(t_row,c2) = sub(s).ex(2).d(j).max_constrict;
                  set(gca,'xlim',      [0.5 7]       );
                  set(gca,'ylim',      [0.5 7]       );
                  title('Max Constriction (mm)')
               case 2
                  x(t_row,c2) = sub(s).ex(1).d(j).t_max_constrict;
                  y(t_row,c2) = sub(s).ex(2).d(j).t_max_constrict;
                  set(gca,'xlim',      [0.6 1.8]       );
                  set(gca,'ylim',      [0.6 1.8]       );
                  title('Time to Max Constriction (s)')
               case 3
                  x(t_row,c2) = sub(s).ex(1).d(j).max_con_vel;
                  y(t_row,c2) = sub(s).ex(2).d(j).max_con_vel;
                  set(gca,'xlim',      [-7 0]       );
                  set(gca,'ylim',      [-7 0]       );
                  title('Max Constrict Velocity (mm/s)')
               case 4
                  x(t_row,c2) = sub(s).ex(1).d(j).t_max_con_vel;
                  y(t_row,c2) = sub(s).ex(2).d(j).t_max_con_vel;
                  set(gca,'xlim',      [0 0.55]       );
                  set(gca,'ylim',      [0 0.55]       );
                  title('Time to Max Constrict Velocity(s)')
               case 5
                  x(t_row,c2) = sub(s).ex(1).d(j).max_dil_vel;
                  y(t_row,c2) = sub(s).ex(2).d(j).max_dil_vel;
                  set(gca,'xlim',      [0 3]       );
                  set(gca,'ylim',      [0 3]       );
                  title('Max Dilation Velocity (mm/s)')
               case 6
                  x(t_row,c2) = sub(s).ex(1).d(j).t_max_dil_vel;
                  y(t_row,c2) = sub(s).ex(2).d(j).t_max_dil_vel;
                  set(gca,'xlim',      [1.2 2.2]       );
                  set(gca,'ylim',      [1.2 2.2]       );
                  title('Time to Max Dilation Velocity (s)')
               case 7
                  x(t_row,c2) = sub(s).ex(1).d(j).T75;
                  y(t_row,c2) = sub(s).ex(2).d(j).T75;
                  set(gca,'xlim',      [0.6 1.8]       );
                  set(gca,'ylim',      [0.6 1.8]       );
                  title('T75 (s)')
               case 8
                  x(t_row,c2) = sub(s).ex(1).d(j).avg_con_vel;
                  y(t_row,c2) = sub(s).ex(2).d(j).avg_con_vel;
                  set(gca,'xlim',      [-3 0]       );
                  set(gca,'ylim',      [-3 0]       );
                  title('Avg Constriction Velocity (mm/s)')
               case 9
                  x(t_row,c2) = sub(s).ex(1).d(j).avg_dil_vel;
                  y(t_row,c2) = sub(s).ex(2).d(j).avg_dil_vel;
                  set(gca,'xlim',      [0 2]       );
                  set(gca,'ylim',      [0 2]       );
                  title('Avg Dilation Velocity (mm/s)')
               case 10
                  x(t_row,c2) = sub(s).ex(1).d(j).min_constrict;
                  y(t_row,c2) = sub(s).ex(2).d(j).min_constrict;
                  set(gca,'xlim',      [0 6]       );
                  set(gca,'ylim',      [0 6]       );
                  title('Minimum Constriction (mm)')

            end %switch

         end % isempty
      end %for s


      hs1 = scatter(x(:,1),y(:,1));
      hs2 = scatter(x(:,2),y(:,2));
      h_x=get(gca,'xlim');
      h_y=get(gca,'ylim');
      plot([h_x(1) h_x(2)], [h_y(1) h_y(2)], 'k:','Linewidth',0.5)
      set(hs1,'CData',colors(1,:),'MarkerEdgeAlpha',0.3,'LineWidth',2   );
      set(hs2,'CData',colors(2,:),'MarkerEdgeAlpha',0.3,'LineWidth',2   );

      [r1, p1]=corr(x(:,1),y(:,1),'rows', 'complete');
      [r2, p2]=corr(x(:,2),y(:,2),'rows', 'complete'  );

      % ICC: absolute agreement, single measurement
      data1 = [x(:,1) y(:,1)];
      data1 = data1(all(~isnan(data1),2),:);

      data2 = [x(:,2) y(:,2)];
      data2 = data2(all(~isnan(data2),2),:);

      [icc1, LB1, UB1, F1, df1_1, df2_1, pICC1] = ICC(data1,'A-1',0.05,0);
      [icc2, LB2, UB2, F2, df1_2, df2_2, pICC2] = ICC(data2,'A-1',0.05,0);


      switch i
          case {1}
              text(0.5,6,['Control n=' num2str(sum(~isnan(x(:,1))))],  'FontName', 'Courier' ,'Color',colors(2,:));
              text(0.5,5,['Concussed   n=' num2str(sum(~isnan(x(:,2))))],  'FontName', 'Courier' ,'Color',colors(1,:));
              text(0.5,5.5,[' \itr= ' num2str(r1,'%3.2f')  ' p=' num2str(p1,'%4.3f') ' ICC=' num2str(icc1,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(2,:));
              text(0.5,4.5,[' \itr= ' num2str(r2,'%3.2f')  ' p=' num2str(p2,'%4.3f') ' ICC=' num2str(icc2,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(1,:));
          case {2}
              text(.6,1.6,[' \itr= ' num2str(r1,'%3.2f')  ' p=' num2str(p1,'%4.3f') ' ICC=' num2str(icc1,'%3.2f') ],  'FontName', 'Courier' ,'Color',colors(2,:));
              text(.6,1.5,[' \itr= ' num2str(r2,'%3.2f')  ' p=' num2str(p2,'%4.3f') ' ICC=' num2str(icc2,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(1,:));
          case {3}
              text(-7,-5,['Control n=' num2str(sum(~isnan(x(:,1))))],  'FontName', 'Courier' ,'Color',colors(2,:));
              text(-7,-6,['Concussed   n=' num2str(sum(~isnan(x(:,2))))],  'FontName', 'Courier' ,'Color',colors(1,:));
              text(-7,-5.5,[' \itr= ' num2str(r1,'%3.2f')  ' p=' num2str(p1,'%4.3f') ' ICC=' num2str(icc1,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(2,:));
              text(-7,-6.5,[' \itr= ' num2str(r2,'%3.2f')  ' p=' num2str(p2,'%4.3f') ' ICC=' num2str(icc2,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(1,:));
          case {4}
              text(0,.15,[' \itr= ' num2str(r1,'%3.2f')  ' p=' num2str(p1,'%4.3f') ' ICC=' num2str(icc1,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(2,:));
              text(0,.1,[' \itr= ' num2str(r2,'%3.2f')  ' p=' num2str(p2,'%4.3f') ' ICC=' num2str(icc2,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(1,:));
          case {5}
              text(0,0.5,[' \itr= ' num2str(r1,'%3.2f')  ' p=' num2str(p1,'%4.3f') ' ICC=' num2str(icc1,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(2,:));
              text(0,0.2,[' \itr= ' num2str(r2,'%3.2f')  ' p=' num2str(p2,'%4.3f') ' ICC=' num2str(icc2,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(1,:));
          case {6}
              text(1.2,1.42,['Control   n=' num2str(sum(~isnan(x(:,1))))],  'FontName', 'Courier' ,'Color',colors(2,:));
              text(1.2,1.3,['Concussed n=' num2str(sum(~isnan(x(:,2))))],  'FontName', 'Courier' ,'Color',colors(1,:));
              text(1.2,1.36,[' \itr= ' num2str(r1,'%3.2f')  ' p=' num2str(p1,'%4.3f') ' ICC=' num2str(icc1,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(2,:));
              text(1.2,1.24,[' \itr= ' num2str(r2,'%3.2f')  ' p=' num2str(p2,'%4.3f') ' ICC=' num2str(icc2,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(1,:));
          case {7}
              text(.6,1.6,[' \itr= ' num2str(r1,'%3.2f')  ' p=' num2str(p1,'%4.3f') ' ICC=' num2str(icc1,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(2,:));
              text(.6,1.5,[' \itr= ' num2str(r2,'%3.2f')  ' p=' num2str(p2,'%4.3f') ' ICC=' num2str(icc2,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(1,:));
          case {8}
              text(-3,-2.3,['Control   n=' num2str(sum(~isnan(x(:,1))))],  'FontName', 'Courier' ,'Color',colors(2,:));
              text(-3,-2.7,['Concussed n=' num2str(sum(~isnan(x(:,2))))],  'FontName', 'Courier' ,'Color',colors(1,:));
              text(-3,-2.5,[' \itr= ' num2str(r1,'%3.2f')  ' p=' num2str(p1,'%4.3f') ' ICC=' num2str(icc1,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(2,:));
              text(-3,-2.9,[' \itr= ' num2str(r2,'%3.2f')  ' p=' num2str(p2,'%4.3f') ' ICC=' num2str(icc2,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(1,:));
          case {9}
              text(0,1.6,[' \itr= ' num2str(r1,'%3.2f')  ' p=' num2str(p1,'%4.3f') ' ICC=' num2str(icc1,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(2,:));
              text(0,1.5,[' \itr= ' num2str(r2,'%3.2f')  ' p=' num2str(p2,'%4.3f') ' ICC=' num2str(icc2,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(1,:));
          case {10}
              text(0,1,[' \itr= ' num2str(r1,'%3.2f')  ' p=' num2str(p1,'%4.3f') ' ICC=' num2str(icc1,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(2,:));
              text(0,0.5,[' \itr= ' num2str(r2,'%3.2f')  ' p=' num2str(p2,'%4.3f') ' ICC=' num2str(icc2,'%3.2f')],  'FontName', 'Courier' ,'Color',colors(1,:));
      end

   end %for j


end %for i