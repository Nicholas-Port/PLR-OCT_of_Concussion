
%extract data and split by sex 

for e = 1:4
   en_male(e).i=0;
   en_female(e).i=0;
   ey_male(e).i=0;
   ey_female(e).i=0;
end


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

            % subplot(4,2,jc(e) )
            % plot(nanmean(sub(s).ex(e).d(1).t_m),nanmean(sub(s).ex(e).d(1).pa_m),'b-');
            % plot(nanmean(sub(s).ex(e).d(2).t_m),nanmean(sub(s).ex(e).d(2).pa_m),'r-');
            % plot(nanmean(sub(s).ex(e).d(3).t_m),nanmean(sub(s).ex(e).d(3).pa_m),'g-');

            if isempty(sub(s).sex)
                s = s+1;
            end
            % Create structures for mean & SE plots
            if sub(s).con == 0 && sub(s).sex == 1
                en_male(e).i = en_male(e).i + 1;
                for d = 1:3
                    en_male(e).d(d).t( en_male(e).i,:) = nanmean(sub(s).ex(e).d(d).t_m         );
                    en_male(e).d(d).pa(en_male(e).i,:) = pix2mm2(nanmean(sub(s).ex(e).d(d).pa_m));
                    [  en_male(e).d(d).max_constrict(   en_male(e).i ), ...
                        en_male(e).d(d).t_max_constrict( en_male(e).i ), ...
                        en_male(e).d(d).max_con_vel(     en_male(e).i ), ...
                        en_male(e).d(d).t_max_con_vel(   en_male(e).i ), ...
                        en_male(e).d(d).max_dil_vel(     en_male(e).i ), ...
                        en_male(e).d(d).t_max_dil_vel(   en_male(e).i ), ...
                        en_male(e).d(d).T75(             en_male(e).i ), ...
                        en_male(e).d(d).avg_con_vel(     en_male(e).i ), ...
                        en_male(e).d(d).avg_dil_vel(     en_male(e).i ), ...
                        en_male(e).d(d).min_constrict(   en_male(e).i ), ...
                        ] = pupil_dynamics3( nanmean(sub(s).ex(e).d(d).t_m), ...
                        pix2mm2(nanmean(sub(s).ex(e).d(d).pa_m))  );
                end %for d
            elseif sub(s).con == 0 && sub(s).sex == 2
                en_female(e).i = en_female(e).i + 1;
                for d = 1:3
                    en_female(e).d(d).t( en_female(e).i,:) = nanmean(sub(s).ex(e).d(d).t_m         );
                    en_female(e).d(d).pa(en_female(e).i,:) = pix2mm2(nanmean(sub(s).ex(e).d(d).pa_m) );
                    [  en_female(e).d(d).max_constrict(   en_female(e).i ), ...
                        en_female(e).d(d).t_max_constrict( en_female(e).i ), ...
                        en_female(e).d(d).max_con_vel(     en_female(e).i ), ...
                        en_female(e).d(d).t_max_con_vel(   en_female(e).i ), ...
                        en_female(e).d(d).max_dil_vel(     en_female(e).i ), ...
                        en_female(e).d(d).t_max_dil_vel(   en_female(e).i ), ...
                        en_female(e).d(d).T75(        en_female(e).i ), ...
                        en_female(e).d(d).avg_con_vel(     en_female(e).i ), ...
                        en_female(e).d(d).avg_dil_vel(     en_female(e).i ), ...
                        en_female(e).d(d).min_constrict(   en_female(e).i ), ...
                        ] = pupil_dynamics3( nanmean(sub(s).ex(e).d(d).t_m), ...
                        pix2mm2(nanmean(sub(s).ex(e).d(d).pa_m))  );
                end %for d

            elseif sub(s).con == 1 && sub(s).sex == 1
                
                ey_male(e).i = ey_male(e).i + 1;
                for d = 1:3
                    ey_male(e).d(d).t( ey_male(e).i,:) = nanmean(sub(s).ex(e).d(d).t_m         );
                    ey_male(e).d(d).pa(ey_male(e).i,:) = pix2mm2(nanmean(sub(s).ex(e).d(d).pa_m) );

                    if ~isempty( sub(s).ex(e).d(d).max_constrict )   %was min_a

                        [  ey_male(e).d(d).max_constrict(   ey_male(e).i ), ...
                            ey_male(e).d(d).t_max_constrict( ey_male(e).i ), ...
                            ey_male(e).d(d).max_con_vel(     ey_male(e).i ), ...
                            ey_male(e).d(d).t_max_con_vel(   ey_male(e).i ), ...
                            ey_male(e).d(d).max_dil_vel(     ey_male(e).i ), ...
                            ey_male(e).d(d).t_max_dil_vel(   ey_male(e).i ), ...
                            ey_male(e).d(d).T75(        ey_male(e).i ), ...
                            ey_male(e).d(d).avg_con_vel(     ey_male(e).i ), ...
                            ey_male(e).d(d).avg_dil_vel(     ey_male(e).i ), ...
                            ey_male(e).d(d).min_constrict(   ey_male(e).i ), ...
                            ] = pupil_dynamics3( nanmean(sub(s).ex(e).d(d).t_m), ...
                            pix2mm2(nanmean(sub(s).ex(e).d(d).pa_m))  );
                    else
                        ey_male(e).d(d).max_constrict(   ey_male(e).i ) = NaN;
                        ey_male(e).d(d).t_max_constrict( ey_male(e).i ) = NaN;
                        ey_male(e).d(d).max_con_vel(     ey_male(e).i ) = NaN;
                        ey_male(e).d(d).t_max_con_vel(   ey_male(e).i ) = NaN;
                        ey_male(e).d(d).max_dil_vel(     ey_male(e).i ) = NaN;
                        ey_male(e).d(d).t_max_dil_vel(   ey_male(e).i ) = NaN;
                        ey_male(e).d(d).T75(             ey_male(e).i ) = NaN;
                        ey_male(e).d(d).avg_con_vel(     ey_male(e).i ) = NaN;
                        ey_male(e).d(d).avg_dil_vel(     ey_male(e).i ) = NaN;
                        ey_male(e).d(d).min_constrict(   ey_male(e).i ) = NaN;
                    end
                end %for d
            elseif sub(s).con == 1 && sub(s).sex == 2
                ey_female(e).i = ey_female(e).i + 1;
                for d = 1:3
                    ey_female(e).d(d).t( ey_female(e).i,:) = nanmean(sub(s).ex(e).d(d).t_m         );
                    ey_female(e).d(d).pa(ey_female(e).i,:) = pix2mm2(nanmean(sub(s).ex(e).d(d).pa_m) );

                    if ~isempty( sub(s).ex(e).d(d).max_constrict )   %was min_a

                        [  ey_female(e).d(d).max_constrict(   ey_female(e).i ), ...
                            ey_female(e).d(d).t_max_constrict( ey_female(e).i ), ...
                            ey_female(e).d(d).max_con_vel(     ey_female(e).i ), ...
                            ey_female(e).d(d).t_max_con_vel(   ey_female(e).i ), ...
                            ey_female(e).d(d).max_dil_vel(     ey_female(e).i ), ...
                            ey_female(e).d(d).t_max_dil_vel(   ey_female(e).i ), ...
                            ey_female(e).d(d).T75(        ey_female(e).i ), ...
                            ey_female(e).d(d).avg_con_vel(     ey_female(e).i ), ...
                            ey_female(e).d(d).avg_dil_vel(     ey_female(e).i ), ...
                            ey_female(e).d(d).min_constrict(   ey_female(e).i ), ...
                            ] = pupil_dynamics3( nanmean(sub(s).ex(e).d(d).t_m), ...
                            pix2mm2(nanmean(sub(s).ex(e).d(d).pa_m))  );
                    else
                        ey_female(e).d(d).max_constrict(   ey_female(e).i ) = NaN;
                        ey_female(e).d(d).t_max_constrict( ey_female(e).i ) = NaN;
                        ey_female(e).d(d).max_con_vel(     ey_female(e).i ) = NaN;
                        ey_female(e).d(d).t_max_con_vel(   ey_female(e).i ) = NaN;
                        ey_female(e).d(d).max_dil_vel(     ey_female(e).i ) = NaN;
                        ey_female(e).d(d).t_max_dil_vel(   ey_female(e).i ) = NaN;
                        ey_female(e).d(d).T75(             ey_female(e).i ) = NaN;
                        ey_female(e).d(d).avg_con_vel(     ey_female(e).i ) = NaN;
                        ey_female(e).d(d).avg_dil_vel(     ey_female(e).i ) = NaN;
                        ey_female(e).d(d).min_constrict(   ey_female(e).i ) = NaN;
                    end
                end %for d
            end


            %end %isemtpy
        end %isempty

        %keyboard
    end %for e
end %for s


%Find all descriptives 

%Create table for male 

for i = 1:4
   table_male(i).stats{1,1} = 'Dim';
   table_male(i).stats{2,1} = 'Medium';
   table_male(i).stats{3,1} = 'Bright';
    for j = 1:3
        table_male(i).stats{j,2} = nanmean( ey_male(i).d(j).max_constrict );
        table_male(i).stats{j,3} = nanstd(  ey_male(i).d(j).max_constrict );
        table_male(i).stats{j,4} = nanmean( en_male(i).d(j).max_constrict );
        table_male(i).stats{j,5} = nanstd(  en_male(i).d(j).max_constrict );
        effectsize = meanEffectSize(en_male(i).d(j).max_constrict, ey_male(i).d(j).max_constrict, effect="Cohen");
        table_male(i).stats{j,6} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey_male(i).d(j).max_constrict,en_male(i).d(j).max_constrict,1000);
        else
            [auc, p] = rocshuf(en_male(i).d(j).max_constrict,ey_male(i).d(j).max_constrict,1000);
        end
        table_male(i).stats{j,7} = num2str(auc,'%3.2f');

        table_male(i).stats{j,8} = nanmean(  ey_male(i).d(j).t_max_constrict );
        table_male(i).stats{j,9} = nanstd(   ey_male(i).d(j).t_max_constrict );
        table_male(i).stats{j,10} = nanmean( en_male(i).d(j).t_max_constrict );
        table_male(i).stats{j,11} = nanstd(  en_male(i).d(j).t_max_constrict );
        effectsize = meanEffectSize( en_male(i).d(j).t_max_constrict, ey_male(i).d(j).t_max_constrict, effect="Cohen");
        table_male(i).stats{j,12} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0.09
            [auc, p] = rocshuf(ey_male(i).d(j).t_max_constrict,en_male(i).d(j).t_max_constrict,1000);
        else
            [auc, p] = rocshuf(en_male(i).d(j).t_max_constrict,ey_male(i).d(j).t_max_constrict,1000);
        end
        table_male(i).stats{j,13} = num2str(auc,'%3.2f');

        table_male(i).stats{j,14} = nanmean( ey_male(i).d(j).max_con_vel );
        table_male(i).stats{j,15} = nanstd( ey_male(i).d(j).max_con_vel );
        table_male(i).stats{j,16} = nanmean( en_male(i).d(j).max_con_vel );
        table_male(i).stats{j,17} = nanstd( en_male(i).d(j).max_con_vel );
        effectsize = meanEffectSize(en_male(i).d(j).max_con_vel, ey_male(i).d(j).max_con_vel, effect="Cohen");
        table_male(i).stats{j,18} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey_male(i).d(j).max_con_vel,en_male(i).d(j).max_con_vel,1000);
        else
            [auc, p] = rocshuf(en_male(i).d(j).max_con_vel,ey_male(i).d(j).max_con_vel,1000);
        end
        table_male(i).stats{j,19} = num2str(auc,'%3.2f');

        table_male(i).stats{j,20} = nanmean( ey_male(i).d(j).t_max_con_vel );
        table_male(i).stats{j,21} = nanstd( ey_male(i).d(j).t_max_con_vel );
        table_male(i).stats{j,22} = nanmean( en_male(i).d(j).t_max_con_vel );
        table_male(i).stats{j,23} = nanstd( en_male(i).d(j).t_max_con_vel );
        effectsize = meanEffectSize(en_male(i).d(j).t_max_con_vel, ey_male(i).d(j).t_max_con_vel, effect="Cohen");
        table_male(i).stats{j,24} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0.08
            [auc, p] = rocshuf(ey_male(i).d(j).t_max_con_vel,en_male(i).d(j).t_max_con_vel,1000);
        else
            [auc, p] = rocshuf(en_male(i).d(j).t_max_con_vel,ey_male(i).d(j).t_max_con_vel,1000);
        end
        table_male(i).stats{j,25} = num2str(auc,'%3.2f');

        table_male(i).stats{j,26} = nanmean( ey_male(i).d(j).max_dil_vel );
        table_male(i).stats{j,27} = nanstd( ey_male(i).d(j).max_dil_vel );
        table_male(i).stats{j,28} = nanmean( en_male(i).d(j).max_dil_vel );
        table_male(i).stats{j,29} = nanstd( en_male(i).d(j).max_dil_vel );
        effectsize = meanEffectSize(en_male(i).d(j).max_dil_vel, ey_male(i).d(j).max_dil_vel, effect="Cohen");
        table_male(i).stats{j,30} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey_male(i).d(j).max_dil_vel,en_male(i).d(j).max_dil_vel,1000);
        else
            [auc, p] = rocshuf(en_male(i).d(j).max_dil_vel,ey_male(i).d(j).max_dil_vel,1000);
        end
        table_male(i).stats{j,31} = num2str(auc,'%3.2f');

        table_male(i).stats{j,32} = nanmean( ey_male(i).d(j).t_max_dil_vel );
        table_male(i).stats{j,33} = nanstd( ey_male(i).d(j).t_max_dil_vel );
        table_male(i).stats{j,34} = nanmean( en_male(i).d(j).t_max_dil_vel );
        table_male(i).stats{j,35} = nanstd( en_male(i).d(j).t_max_dil_vel );
        effectsize = meanEffectSize(en_male(i).d(j).t_max_dil_vel, ey_male(i).d(j).t_max_dil_vel, effect="Cohen");
        table_male(i).stats{j,36} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey_male(i).d(j).t_max_dil_vel,en_male(i).d(j).t_max_dil_vel,1000);
        else
            [auc, p] = rocshuf(en_male(i).d(j).t_max_dil_vel,ey_male(i).d(j).t_max_dil_vel,1000);
        end
        table_male(i).stats{j,37} = num2str(auc,'%3.2f');

        table_male(i).stats{j,38} = nanmean( ey_male(i).d(j).T75 );
        table_male(i).stats{j,39} = nanstd( ey_male(i).d(j).T75 );
        table_male(i).stats{j,40} = nanmean( en_male(i).d(j).T75);
        table_male(i).stats{j,41} = nanstd( en_male(i).d(j).T75 );
        effectsize = meanEffectSize(en_male(i).d(j).T75, ey_male(i).d(j).T75, effect="Cohen");
        table_male(i).stats{j,42} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey_male(i).d(j).T75,en_male(i).d(j).T75,1000);
        else
            [auc, p] = rocshuf(en_male(i).d(j).T75,ey_male(i).d(j).T75,1000);
        end
        table_male(i).stats{j,43} = num2str(auc,'%3.2f');

        table_male(i).stats{j,44} = nanmean( ey_male(i).d(j).avg_con_vel );
        table_male(i).stats{j,45} = nanstd( ey_male(i).d(j).avg_con_vel );
        table_male(i).stats{j,46} = nanmean( en_male(i).d(j).avg_con_vel );
        table_male(i).stats{j,47} = nanstd( en_male(i).d(j).avg_con_vel );
        effectsize = meanEffectSize(en_male(i).d(j).avg_con_vel, ey_male(i).d(j).avg_con_vel, effect="Cohen");
        table_male(i).stats{j,48} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey_male(i).d(j).avg_con_vel,en_male(i).d(j).avg_con_vel,1000);
        else
            [auc, p] = rocshuf(en_male(i).d(j).avg_con_vel,ey_male(i).d(j).avg_con_vel,1000);
        end
        table_male(i).stats{j,49} = num2str(auc,'%3.2f');

        table_male(i).stats{j,50} = nanmean( ey_male(i).d(j).avg_dil_vel );
        table_male(i).stats{j,51} = nanstd( ey_male(i).d(j).avg_dil_vel );
        table_male(i).stats{j,52} = nanmean( en_male(i).d(j).avg_dil_vel );
        table_male(i).stats{j,53} = nanstd( en_male(i).d(j).avg_dil_vel );
        effectsize = meanEffectSize(en_male(i).d(j).avg_dil_vel, ey_male(i).d(j).avg_dil_vel, effect="Cohen");
        table_male(i).stats{j,54} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey_male(i).d(j).avg_dil_vel,en_male(i).d(j).avg_dil_vel,1000);
        else
            [auc, p] = rocshuf(en_male(i).d(j).avg_dil_vel,ey_male(i).d(j).avg_dil_vel,1000);
        end
        table_male(i).stats{j,55} = num2str(auc,'%3.2f');

        table_male(i).stats{j,56} = nanmean( ey_male(i).d(j).min_constrict );
        table_male(i).stats{j,57} = nanstd( ey_male(i).d(j).min_constrict );
        table_male(i).stats{j,58} = nanmean( en_male(i).d(j).min_constrict );
        table_male(i).stats{j,59} = nanstd( en_male(i).d(j).min_constrict );
        effectsize = meanEffectSize(en_male(i).d(j).min_constrict, ey_male(i).d(j).min_constrict, effect="Cohen");
        table_male(i).stats{j,60} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey_male(i).d(j).min_constrict,en_male(i).d(j).min_constrict,1000);
        else
            [auc, p] = rocshuf(en_male(i).d(j).min_constrict,ey_male(i).d(j).min_constrict,1000);
        end
        table_male(i).stats{j,61} = num2str(auc,'%3.2f');


    end %for j


table_male(i).stats_table = array2table(table_male(i).stats,'VariableNames',{'Light' 'max_constrict_y' 'max_constrict_y_std' 'max_constrict_n' 'max_constrict_n_std' 'max_constrict_effectsize' 'max_constrict_auc' 't_to_max_constrict_y'  ... 
   't_to_max_constrict_y_std' 't_to_max_constrict_n' 't_to_max_constrict_n_std' 't_to_max_constrict_effectsize' 't_to_max_constrict_auc' 'max_con_vel_y' 'max_con_vel_y_std' 'max_con_vel_n' 'max_con_vel_n_std' 'max_con_vel_effectsize' 'max_con_vel_auc' ...
   't_to_max_con_vel_y' 't_to_max_con_vel_y_std' 't_to_max_con_vel_n' 't_to_max_con_vel_n_std' 't_to_max_con_vel_effectsize' 't_to_max_con_vel_auc' 'max_dil_vel_y' 'max_dil_vel_y_std' 'max_dil_vel_n' 'max_dil_vel_n_std' 'max_dil_vel_effectsize' 'max_dil_vel_auc' ...
   't_to_max_dil_vel_y' 't_to_max_dil_vel_y_std' 't_to_max_dil_vel_n' 't_to_max_dil_vel_n_std' 't_to_max_dil_vel_effectsize' 't_to_max_dil_vel_auc' 'T75_y' 'T75_y_std' 'T75_n' 'T75_n_std' 'T75_effectsize' 'T75_auc' 'avg_con_vel_y' 'avg_con_vel_y_std' 'avg_con_vel_n'...
   'avg_con_vel_n_std' 'avg_con_vel_effectsize' 'avg_con_vel_auc' 'avg_dil_vel_y' 'avg_dil_vel_y_std' 'avg_dil_vel_n' 'avg_dil_vel_n_std' 'avg_dil_vel_effectsize' 'avg_dil_vel_auc' 'min_constrict_y' 'min_constrict_y_std' 'min_constrict_n' 'min_constrict_n_std' 'min_constrict_effectsize' 'min_constrict_auc'} );



end %for i


%Table for female

for i = 1:4
   table_female(i).stats{1,1} = 'Dim';
   table_female(i).stats{2,1} = 'Medium';
   table_female(i).stats{3,1} = 'Bright';
    for j = 1:3
        table_female(i).stats{j,2} = nanmean( ey_female(i).d(j).max_constrict );
        table_female(i).stats{j,3} = nanstd(  ey_female(i).d(j).max_constrict );
        table_female(i).stats{j,4} = nanmean( en_female(i).d(j).max_constrict );
        table_female(i).stats{j,5} = nanstd(  en_female(i).d(j).max_constrict );
        effectsize = meanEffectSize(en_female(i).d(j).max_constrict, ey_female(i).d(j).max_constrict, effect="Cohen");
        table_female(i).stats{j,6} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey_female(i).d(j).max_constrict,en_female(i).d(j).max_constrict,1000);
        else
            [auc, p] = rocshuf(en_female(i).d(j).max_constrict,ey_female(i).d(j).max_constrict,1000);
        end
        table_female(i).stats{j,7} = num2str(auc,'%3.2f');

        table_female(i).stats{j,8} = nanmean(  ey_female(i).d(j).t_max_constrict );
        table_female(i).stats{j,9} = nanstd(   ey_female(i).d(j).t_max_constrict );
        table_female(i).stats{j,10} = nanmean( en_female(i).d(j).t_max_constrict );
        table_female(i).stats{j,11} = nanstd(  en_female(i).d(j).t_max_constrict );
        effectsize = meanEffectSize( en_female(i).d(j).t_max_constrict, ey_female(i).d(j).t_max_constrict, effect="Cohen");
        table_female(i).stats{j,12} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0.09
            [auc, p] = rocshuf(ey_female(i).d(j).t_max_constrict,en_female(i).d(j).t_max_constrict,1000);
        else
            [auc, p] = rocshuf(en_female(i).d(j).t_max_constrict,ey_female(i).d(j).t_max_constrict,1000);
        end
        table_female(i).stats{j,13} = num2str(auc,'%3.2f');

        table_female(i).stats{j,14} = nanmean( ey_female(i).d(j).max_con_vel );
        table_female(i).stats{j,15} = nanstd( ey_female(i).d(j).max_con_vel );
        table_female(i).stats{j,16} = nanmean( en_female(i).d(j).max_con_vel );
        table_female(i).stats{j,17} = nanstd( en_female(i).d(j).max_con_vel );
        effectsize = meanEffectSize(en_female(i).d(j).max_con_vel, ey_female(i).d(j).max_con_vel, effect="Cohen");
        table_female(i).stats{j,18} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey_female(i).d(j).max_con_vel,en_female(i).d(j).max_con_vel,1000);
        else
            [auc, p] = rocshuf(en_female(i).d(j).max_con_vel,ey_female(i).d(j).max_con_vel,1000);
        end
        table_female(i).stats{j,19} = num2str(auc,'%3.2f');

        table_female(i).stats{j,20} = nanmean( ey_female(i).d(j).t_max_con_vel );
        table_female(i).stats{j,21} = nanstd( ey_female(i).d(j).t_max_con_vel );
        table_female(i).stats{j,22} = nanmean( en_female(i).d(j).t_max_con_vel );
        table_female(i).stats{j,23} = nanstd( en_female(i).d(j).t_max_con_vel );
        effectsize = meanEffectSize(en_female(i).d(j).t_max_con_vel, ey_female(i).d(j).t_max_con_vel, effect="Cohen");
        table_female(i).stats{j,24} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0.08
            [auc, p] = rocshuf(ey_female(i).d(j).t_max_con_vel,en_female(i).d(j).t_max_con_vel,1000);
        else
            [auc, p] = rocshuf(en_female(i).d(j).t_max_con_vel,ey_female(i).d(j).t_max_con_vel,1000);
        end
        table_female(i).stats{j,25} = num2str(auc,'%3.2f');

        table_female(i).stats{j,26} = nanmean( ey_female(i).d(j).max_dil_vel );
        table_female(i).stats{j,27} = nanstd( ey_female(i).d(j).max_dil_vel );
        table_female(i).stats{j,28} = nanmean( en_female(i).d(j).max_dil_vel );
        table_female(i).stats{j,29} = nanstd( en_female(i).d(j).max_dil_vel );
        effectsize = meanEffectSize(en_female(i).d(j).max_dil_vel, ey_female(i).d(j).max_dil_vel, effect="Cohen");
        table_female(i).stats{j,30} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey_female(i).d(j).max_dil_vel,en_female(i).d(j).max_dil_vel,1000);
        else
            [auc, p] = rocshuf(en_female(i).d(j).max_dil_vel,ey_female(i).d(j).max_dil_vel,1000);
        end
        table_female(i).stats{j,31} = num2str(auc,'%3.2f');

        table_female(i).stats{j,32} = nanmean( ey_female(i).d(j).t_max_dil_vel );
        table_female(i).stats{j,33} = nanstd( ey_female(i).d(j).t_max_dil_vel );
        table_female(i).stats{j,34} = nanmean( en_female(i).d(j).t_max_dil_vel );
        table_female(i).stats{j,35} = nanstd( en_female(i).d(j).t_max_dil_vel );
        effectsize = meanEffectSize(en_female(i).d(j).t_max_dil_vel, ey_female(i).d(j).t_max_dil_vel, effect="Cohen");
        table_female(i).stats{j,36} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey_female(i).d(j).t_max_dil_vel,en_female(i).d(j).t_max_dil_vel,1000);
        else
            [auc, p] = rocshuf(en_female(i).d(j).t_max_dil_vel,ey_female(i).d(j).t_max_dil_vel,1000);
        end
        table_female(i).stats{j,37} = num2str(auc,'%3.2f');

        table_female(i).stats{j,38} = nanmean( ey_female(i).d(j).T75 );
        table_female(i).stats{j,39} = nanstd( ey_female(i).d(j).T75 );
        table_female(i).stats{j,40} = nanmean( en_female(i).d(j).T75);
        table_female(i).stats{j,41} = nanstd( en_female(i).d(j).T75 );
        effectsize = meanEffectSize(en_female(i).d(j).T75, ey_female(i).d(j).T75, effect="Cohen");
        table_female(i).stats{j,42} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey_female(i).d(j).T75,en_female(i).d(j).T75,1000);
        else
            [auc, p] = rocshuf(en_female(i).d(j).T75,ey_female(i).d(j).T75,1000);
        end
        table_female(i).stats{j,43} = num2str(auc,'%3.2f');

        table_female(i).stats{j,44} = nanmean( ey_female(i).d(j).avg_con_vel );
        table_female(i).stats{j,45} = nanstd( ey_female(i).d(j).avg_con_vel );
        table_female(i).stats{j,46} = nanmean( en_female(i).d(j).avg_con_vel );
        table_female(i).stats{j,47} = nanstd( en_female(i).d(j).avg_con_vel );
        effectsize = meanEffectSize(en_female(i).d(j).avg_con_vel, ey_female(i).d(j).avg_con_vel, effect="Cohen");
        table_female(i).stats{j,48} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey_female(i).d(j).avg_con_vel,en_female(i).d(j).avg_con_vel,1000);
        else
            [auc, p] = rocshuf(en_female(i).d(j).avg_con_vel,ey_female(i).d(j).avg_con_vel,1000);
        end
        table_female(i).stats{j,49} = num2str(auc,'%3.2f');

        table_female(i).stats{j,50} = nanmean( ey_female(i).d(j).avg_dil_vel );
        table_female(i).stats{j,51} = nanstd( ey_female(i).d(j).avg_dil_vel );
        table_female(i).stats{j,52} = nanmean( en_female(i).d(j).avg_dil_vel );
        table_female(i).stats{j,53} = nanstd( en_female(i).d(j).avg_dil_vel );
        effectsize = meanEffectSize(en_female(i).d(j).avg_dil_vel, ey_female(i).d(j).avg_dil_vel, effect="Cohen");
        table_female(i).stats{j,54} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey_female(i).d(j).avg_dil_vel,en_female(i).d(j).avg_dil_vel,1000);
        else
            [auc, p] = rocshuf(en_female(i).d(j).avg_dil_vel,ey_female(i).d(j).avg_dil_vel,1000);
        end
        table_female(i).stats{j,55} = num2str(auc,'%3.2f');

        table_female(i).stats{j,56} = nanmean( ey_female(i).d(j).min_constrict );
        table_female(i).stats{j,57} = nanstd( ey_female(i).d(j).min_constrict );
        table_female(i).stats{j,58} = nanmean( en_female(i).d(j).min_constrict );
        table_female(i).stats{j,59} = nanstd( en_female(i).d(j).min_constrict );
        effectsize = meanEffectSize(en_female(i).d(j).min_constrict, ey_female(i).d(j).min_constrict, effect="Cohen");
        table_female(i).stats{j,60} = num2str(effectsize{1,1}, '%3.2f');
        if effectsize{1,1} < 0
            [auc, p] = rocshuf(ey_female(i).d(j).min_constrict,en_female(i).d(j).min_constrict,1000);
        else
            [auc, p] = rocshuf(en_female(i).d(j).min_constrict,ey_female(i).d(j).min_constrict,1000);
        end
        table_female(i).stats{j,61} = num2str(auc,'%3.2f');


    end %for j


table_female(i).stats_table = array2table(table_female(i).stats,'VariableNames',{'Light' 'max_constrict_y' 'max_constrict_y_std' 'max_constrict_n' 'max_constrict_n_std' 'max_constrict_effectsize' 'max_constrict_auc' 't_to_max_constrict_y'  ... 
   't_to_max_constrict_y_std' 't_to_max_constrict_n' 't_to_max_constrict_n_std' 't_to_max_constrict_effectsize' 't_to_max_constrict_auc' 'max_con_vel_y' 'max_con_vel_y_std' 'max_con_vel_n' 'max_con_vel_n_std' 'max_con_vel_effectsize' 'max_con_vel_auc' ...
   't_to_max_con_vel_y' 't_to_max_con_vel_y_std' 't_to_max_con_vel_n' 't_to_max_con_vel_n_std' 't_to_max_con_vel_effectsize' 't_to_max_con_vel_auc' 'max_dil_vel_y' 'max_dil_vel_y_std' 'max_dil_vel_n' 'max_dil_vel_n_std' 'max_dil_vel_effectsize' 'max_dil_vel_auc' ...
   't_to_max_dil_vel_y' 't_to_max_dil_vel_y_std' 't_to_max_dil_vel_n' 't_to_max_dil_vel_n_std' 't_to_max_dil_vel_effectsize' 't_to_max_dil_vel_auc' 'T75_y' 'T75_y_std' 'T75_n' 'T75_n_std' 'T75_effectsize' 'T75_auc' 'avg_con_vel_y' 'avg_con_vel_y_std' 'avg_con_vel_n'...
   'avg_con_vel_n_std' 'avg_con_vel_effectsize' 'avg_con_vel_auc' 'avg_dil_vel_y' 'avg_dil_vel_y_std' 'avg_dil_vel_n' 'avg_dil_vel_n_std' 'avg_dil_vel_effectsize' 'avg_dil_vel_auc' 'min_constrict_y' 'min_constrict_y_std' 'min_constrict_n' 'min_constrict_n_std' 'min_constrict_effectsize' 'min_constrict_auc'} );



end %for i
