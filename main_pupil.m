% main_pupil has everything in one place 

close all;
clear all;


ORANGE  = [ 1  .5  0 ];
CYAN    = [ 0  .5  1 ];
RED     = [ 1   0  0 ];
BLUE    = [ 0   0  1 ];
MAGENTA = [.8   0 .8 ];
GREEN   = [ 0  .8 .2 ];
BLACK   = [ 0   0  0 ];
DARK_ORANGE = [0.5 0.25  0.0];
DARK_GREEN  = [0.0 0.40  0.1];
DARK_CYAN   = [0.0 0.25  0.5];
DARK_MAGENTA= [0.4 0.00  0.4];

color_tab(1,:) = ORANGE;
color_tab(2,:) = CYAN;
color_tab(3,:) = MAGENTA;


S1 = 1; % Start with this subject as the first subject

dbstop if error

PIX2DEG       = 18.95/(1920/2);
% The average minium pupil aperature is -933 pixels so conversion is
% 933 pixels to 3.5 mm
PIX2MM = 3.5/933;



DEBUG1        = 0;
DEBUG2        = 0;

DO_NORMALIZED_PUPIL = 0;

USE_BIG_PUPIL = 0;


DIR = '*insert pathway*';  %Set location of the subject files


if ~USE_BIG_PUPIL

   % Load the database

   pupils_db1;

   disp('Loading:')
   % Load in the data
   for s = S1:length(sub)
      for e = 1:length( sub(s).ex )
         if ~strcmp(sub(s).ex(e).fn,'')
            disp(['s =' num2str(s) ' e =' num2str(e) ])
            load( [DIR '/' sub(s).ex(e).fn ],'d' );
            sub(s).ex(e).d = d;
         end
      end %for e
   end

   % Set all trials as ok, then hand a remove a few
   for s = S1:length(sub)
      for e = 1:length( sub(s).ex )
         if ~strcmp(sub(s).ex(e).fn,'')
            for ty = 1:length( sub(s).ex(e).d )
               for tr = 1:length( sub(s).ex(e).d(ty).trial )

                  sub(s).ex(e).type(ty).trial(tr).ok = 1;

               end %tr
            end %for ty
         end
      end %for e
   end
   % Remove this
   sub(60).ex(1).d(1).trial(6).ok = 0;

   disp('Read Data Complete')
   disp('')

   disp('Analysis Part 1');


  

   % Analysis
   
   parfor s = S1: length(sub)  %or parfor to have it run faster              % Normally % S1: length(sub)
      for e = 1:length( sub(s).ex )        % Normally % 1:length( sub(s).ex )

         disp(['s = ' num2str(s) ' e = ' num2str(e) ]);

         if ~isempty(sub(s).ex(e).fn)

            if DEBUG1
               hf1 = figure;
               h1=subplot(1,2,1);
               h2=subplot(1,2,2);

               axes(h1);
               hold on
               set(gca,'TickDir','Out');
               set(gca,'xlim',[ -0.5  5.0 ]);
               if DO_NORMALIZED_PUPIL
                  set(gca,'ylim',[-5 3 ]);
               else
                  set(gca,'ylim',[1 16 ]);
              end
               
               plot([-0.5 5], [0      0],'k--')
               plot([0    0], [-200 200],'k--')
               xlabel('Time (s)');
               ylabel('Pupil area (pixels)');
               title(['s = ' num2str(s) ' e = ' num2str(e)]);

               axes(h2);
               hold on
               set(gca,'TickDir','Out');
               set(gca,'xlim',[ -0.5  5.0]);
               if DO_NORMALIZED_PUPIL
                  set(gca,'ylim',[-1800 1000]);               
               else
                  set(gca,'ylim',[1 13]);

               end
               plot([-0.5 5], [0      0],'k--')
               plot([0    0], [-200 200],'k--')
               xlabel('Time (s)');
               ylabel('Pupil area (pixels)');

               axes(h1);
            end


            for ty = 1:length( sub(s).ex(e).d )    % Normally % 1:length( sub(s).ex(e).d )
               for tr = 1:length( sub(s).ex(e).d(ty).trial )  % Normally %1:length( sub(s).ex(e).d(ty).trial )

                  sub(s).ex(e).d(ty).t_m(  tr, 1:12000) = NaN;
                  sub(s).ex(e).d(ty).pa_m( tr, 1:12000) = NaN;
                  % Make a second version and store the non-interpolated
                  % version
                  sub(s).ex(e).d(ty).t_m2(  tr, 1:12000) = NaN;
                  sub(s).ex(e).d(ty).pa_m2( tr, 1:12000) = NaN;

                  if sub(s).ex(e).d(ty).trial(tr).ok == 1

                     disp(tr)

                     s1i =  sub(s).ex(e).d(ty).trial(tr).step3_i;  % Stimulus On Index
                     s1  =  sub(s).ex(e).d(ty).trial(tr).step3_t;  % Time of Stimulus on
                     t   =  sub(s).ex(e).d(ty).trial(tr).t;
                     pa1 =  sub(s).ex(e).d(ty).trial(tr).pa1;
                     pa2 =  sub(s).ex(e).d(ty).trial(tr).pa2;


                     % Lost signal fix when the value is 32768
                     if min(pa1) > 32000
                        disp(['High Value Fix mean=' num2str(mean(pa1)) ' ty=' num2str(ty) ' tr= ' num2str(tr)]);
                        pa1(1:length(pa1))=NaN;
                     end

                     if min(pa2) > 32000
                        disp(['High Value Fix mean=' num2str(mean(pa2)) ' ty=' num2str(ty) ' tr= ' num2str(tr)]);
                        pa2(1:length(pa2))=NaN;
                     end


                     % Use eye postion for blink detection
                     x  = sub(s).ex(e).d(ty).trial(tr).x*PIX2DEG;
                     y  = sub(s).ex(e).d(ty).trial(tr).y*PIX2DEG;
                     x2 = sub(s).ex(e).d(ty).trial(tr).x2*PIX2DEG;
                     y2 = sub(s).ex(e).d(ty).trial(tr).y2*PIX2DEG;


                     [blink_n, x2,y2,pa1,pa2] = blink_remove8(x,y,x2,y2,pa1,pa2,t); % Nans for blinks

                     pa = nanmean([pa1' pa2'],2); %Average the two pupils
                     pat = pa;



                     % Interpolate PA through blinks
                     pa2= pa(find(~isnan(pa)));
                     t2 =  t(find(~isnan(pa)));

                     if size(pa2,1) ~= 0
                        pa3 = interp1(t2,pa2,t); %Linear Interpolation
                        pa3 = filter_nan8(pa3);  %Filter out high frequency noise
                     else
                        pa3 = pa; % Do nothing
                     end



                     %nv  = nanmean(pa( s1i-100:s1i)); % normalize - last 100 ms before stimulus onset
                     %nv3 = nanmean(pa3(s1i-100:s1i)); % normalize - last 100 ms before stimulus onset

                     %nv  = nanmean(pa( s1i-300:s1i)); % normalize - last 300 ms before stimulus onset % Changed from 100 to 300 7/15/22


                     % 3-1-2025
                     % There are problems with a large when if the pupil is
                     % moving alot.  Shorten the window if too much
                     % movement

                     nv3 = nanmean(pa3(s1i-300:s1i)); % normalize - last 300 ms before stimulus onset
                     if nv3 > 100
                        nv3 = nanmean(pa3(s1i-200:s1i));
                     end
                     if nv3 > 100
                        nv3 = nanmean(pa3(s1i-100:s1i));
                     end
                     if nv3 > 100
                        nv3 = nanmean(pa3(s1i-50:s1i));
                     end
                        
                     % Maybe don't do normalized pupils - 9-22-25.  None of
                     % the key papers analyze a normalized pupil

                     if DO_NORMALIZED_PUPIL
                        % do nothing
                     else
                        nv3 = 0;
                     end


                     if DEBUG2 %&& ty ==3  && tr == 1
                        hf2 = figure;
                        hold on

                        plot(t-t(1),  pat,'r-')
                        plot(t2-t2(1),pa2,'bo')
                        plot(t-t(1),  pa3,'go')
                        title(['s=' num2str(s) ' e=' num2str(e) ' ty=' num2str(ty) ' tr=' num2str(tr)])
                        keyboard
                     end


                     t2  = t-s1; % Align time to stimulus onset
                     t3  = t-s1; % Align time to stimulus onset


                     %  Find the middle section of data we want, before and after
                     %  stimulus onset
                     ss1 = find(t3 <= -0.5);
                     ss2 = find(t3 >= 5.0);
                     ss1 = ss1(end);
                     ss2 = ss2(1);

                     % Find the percent of signal during the time window
                     count_nan = isnan(pa(ss1:ss2) );
                     percent_nan = sum(count_nan)/length(pa(ss1:ss2))*100;



                     % Is there enough data to analyze the interpolated
                     % version ?

                     if percent_nan < 40 %
                        sub(s).ex(e).d(ty).tr(tr).ok = 1;
                        sub(s).ex(e).d(ty).t_m( tr, 1:ss2-ss1+1) = t3(ss1:ss2)   ; % Mean structure
                        sub(s).ex(e).d(ty).pa_m(tr, 1:ss2-ss1+1) = pa3(ss1:ss2)-nv3; % Mean structure % Use to be nv

                     else
                        sub(s).ex(e).d(ty).tr(tr).ok = 0;

                     end

                     if sub(s).ex(e).d(ty).tr(tr).ok
                        [  sub(s).ex(e).d(ty).tr(tr).max_constrict, ...
                           sub(s).ex(e).d(ty).tr(tr).t_max_constrict, ...
                           sub(s).ex(e).d(ty).tr(tr).max_con_vel, ...
                           sub(s).ex(e).d(ty).tr(tr).t_max_con_vel, ...
                           sub(s).ex(e).d(ty).tr(tr).max_dil_vel, ...
                           sub(s).ex(e).d(ty).tr(tr).t_max_dil_vel, ...
                           sub(s).ex(e).d(ty).tr(tr).T75, ...
                           sub(s).ex(e).d(ty).tr(tr).avg_con_vel, ...
                           sub(s).ex(e).d(ty).tr(tr).avg_dil_vel, ...
                           sub(s).ex(e).d(ty).tr(tr).min_constrict, ...
                           ] = pupil_dynamics3( t3(ss1:ss2), pix2mm2(pa3(ss1:ss2)-nv3) );
                     end

                     if DEBUG1
                        figure(hf1)
                        plot(t3,pix2mm2(pa3-nv3), '.','Color', color_tab(ty,:)); %used to be pa, 7/15/22

                        if sub(s).ex(e).d(ty).tr(tr).ok
                           plot(t3, pix2mm2(pa3-nv3),'-','Color', color_tab(ty,:),'LineWidth',2);
                        else
                           plot(t3, pix2mm2(pa3-nv3),'k-','LineWidth',2);
                        end

                        iii = find(t3 < 1.0);
                        text(t3(iii(end))+rand(1,1)/8, pix2mm2(pa3(iii(end))-nv3), num2str(percent_nan,'%2.0f')  );
                        pause(1)

                     end


                  end %if ok

               end %tr

               % Store the pupil dynamics for each subject and trial type
                  [  sub(s).ex(e).d(ty).max_constrict, ...
                     sub(s).ex(e).d(ty).t_max_constrict, ...
                     sub(s).ex(e).d(ty).max_con_vel, ...
                     sub(s).ex(e).d(ty).t_max_con_vel, ...
                     sub(s).ex(e).d(ty).max_dil_vel, ...
                     sub(s).ex(e).d(ty).t_max_dil_vel, ...
                     sub(s).ex(e).d(ty).T75, ...
                     sub(s).ex(e).d(ty).avg_con_vel, ...
                     sub(s).ex(e).d(ty).avg_dil_vel, ...
                     sub(s).ex(e).d(ty).min_constrict, ...
                     ] = pupil_dynamics4( nanmean(sub(s).ex(e).d(ty).t_m), ...
                                          pix2mm2(nanmean(sub(s).ex(e).d(ty).pa_m))  );

            end %ty

            if DEBUG1
               axes(h2);
               for ty = 1:3
                  plot(nanmean(sub(s).ex(e).d(ty).t_m),pix2mm2(nanmean(sub(s).ex(e).d(ty).pa_m)),...
                     '-','Color', color_tab(ty,:),'LineWidth',3);

               end %ty

               keyboard

            end %if DEBUG1

         end %isempty(sub(s).ex(e).fn

      end %for e

   end %for s

   %keyboard


   disp(' Doing pupil dynamics');

   DEBUG2 = 0;

   for s = S1:length(sub)
      for e = 1:length( sub(s).ex )
         if ~strcmp(sub(s).ex(e).fn,'')
            for ty = 1:3

               disp([num2str(s) ' ' num2str(e) ' ' num2str(ty) ])

               sub(s).ex(e).d(ty).mt  = nanmean(sub(s).ex(e).d(ty).t_m);
               %sub(s).ex(e).d(ty).dpa = gradient(nanmean(sub(s).ex(e).d(ty).pa_m));
               % Extra filtering
               sub(s).ex(e).d(ty).dpa = filter_nan8(gradient(filter_nan8(nanmean(sub(s).ex(e).d(ty).pa_m))));
               % No extra filtering
               %sub(s).ex(e).d(ty).dpa = gradient(nanmean(sub(s).ex(e).d(ty).pa_m));

               %pa3 = filter_nan8(pa3);  %Filter out high frequency noise


               if DEBUG2

                  figure
                  subplot(2,1,1)
                  hold on
                  plot(nanmean(sub(s).ex(e).d(ty).t_m(:,s1:s2)),nanmean(sub(s).ex(e).d(ty).pa_m(:,s1:s2)),'b-','LineWidth',2 );
                  plot(temp_t(i3),m3,'ro','MarkerSize',16);
                  title(['s = ' num2str(s) ' e = ' num2str(e) ' ty = ' num2str(ty) ]);

                  subplot(2,1,2)
                  hold on
                  plot(sub(s).ex(e).d(ty).mt(s1:s2),sub(s).ex(e).d(ty).dpa(s1:s2),'b-','lineWidth',2);
                  plot(temp_t(i1),m1,'ro','MarkerSize',16);
                  plot(temp_t(i2),m2,'ro','MarkerSize',16);


                  %keyboard
                  %pause(3)
                  %close all

               end

               %keyboard

            end %d

         end %if empty
      end %e
   end %s


else
      load('*input pathway*/big_pupil1');

end %USE_BIG_PUPIL


%save -v7.3 /*input pathway*/bigpupil1
keyboard

Pupil_plots1
Correlation_plots1
IndvSub_CorrelationPlot1
Stats_Table_Export
%Table_by_sex

% Fini