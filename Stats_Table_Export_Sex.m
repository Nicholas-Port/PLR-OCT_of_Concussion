%make stats table to export for manuscript
for tp = 1:4

   % Max Constrict
   table_female_export(tp).stats{1,1} = num2str([num2str(table_female(tp).stats{1,4}, '%4.2f') ', ' num2str(table_female(tp).stats{2,4}, '%4.2f') ', ' num2str(table_female(tp).stats{3,4}, '%4.2f')]);
   table_female_export(tp).stats{1,2} = num2str([num2str(table_female(tp).stats{1,5}, '%4.2f') ', ' num2str(table_female(tp).stats{2,5}, '%4.2f') ', ' num2str(table_female(tp).stats{3,5}, '%4.2f')]);
   table_female_export(tp).stats{1,3} = num2str([num2str(table_female(tp).stats{1,2}, '%4.2f') ', ' num2str(table_female(tp).stats{2,2}, '%4.2f') ', ' num2str(table_female(tp).stats{3,2}, '%4.2f')]);
   table_female_export(tp).stats{1,4} = num2str([num2str(table_female(tp).stats{1,3}, '%4.2f') ', ' num2str(table_female(tp).stats{2,3}, '%4.2f') ', ' num2str(table_female(tp).stats{3,3}, '%4.2f')]);
   table_female_export(tp).stats{1,5} = num2str([num2str(table_female(tp).stats{1,6}, '%4.2f') ', ' num2str(table_female(tp).stats{2,6}, '%4.2f') ', ' num2str(table_female(tp).stats{3,6}, '%4.2f')]);
   table_female_export(tp).stats{1,6} = num2str([num2str(table_female(tp).stats{1,7}, '%4.2f') ', ' num2str(table_female(tp).stats{2,7}, '%4.2f') ', ' num2str(table_female(tp).stats{3,7}, '%4.2f')]);
   [h, p1, ci, stats] = ttest2(ey_female(tp).d(1).max_constrict, en_female(tp).d(1).max_constrict);
   [h, p2, ci, stats] = ttest2(ey_female(tp).d(2).max_constrict, en_female(tp).d(2).max_constrict);
   [h, p3, ci, stats] = ttest2(ey_female(tp).d(3).max_constrict, en_female(tp).d(3).max_constrict);
   table_female_export(tp).stats{1,7} = num2str([num2str(p1, '%4.3f') ',' num2str(p2, '%4.3f') ',' num2str(p3, '%4.3f')]);

   % T_Max_Constrict
   table_female_export(tp).stats{2,1} = num2str([num2str(table_female(tp).stats{1,10}, '%4.2f') ', ' num2str(table_female(tp).stats{2,10}, '%4.2f') ', ' num2str(table_female(tp).stats{3,10}, '%4.2f')]);
   table_female_export(tp).stats{2,2} = num2str([num2str(table_female(tp).stats{1,11}, '%4.2f') ', ' num2str(table_female(tp).stats{2,11}, '%4.2f') ', ' num2str(table_female(tp).stats{3,11}, '%4.2f')]);
   table_female_export(tp).stats{2,3} = num2str([num2str(table_female(tp).stats{1,8},  '%4.2f') ', ' num2str(table_female(tp).stats{2,8},  '%4.2f') ', ' num2str(table_female(tp).stats{3,8}, '%4.2f')]);
   table_female_export(tp).stats{2,4} = num2str([num2str(table_female(tp).stats{1,9},  '%4.2f') ', ' num2str(table_female(tp).stats{2,9},  '%4.2f') ', ' num2str(table_female(tp).stats{3,9}, '%4.2f')]);
   table_female_export(tp).stats{2,5} = num2str([num2str(table_female(tp).stats{1,12}, '%4.2f') ', ' num2str(table_female(tp).stats{2,12}, '%4.2f') ', ' num2str(table_female(tp).stats{3,12}, '%4.2f')]);
   table_female_export(tp).stats{2,6} = num2str([num2str(table_female(tp).stats{1,13}, '%4.2f') ', ' num2str(table_female(tp).stats{2,13}, '%4.2f') ', ' num2str(table_female(tp).stats{3,13}, '%4.2f')]);
   [h, p1, ci, stats] = ttest2(ey_female(tp).d(1).t_max_constrict, en_female(tp).d(1).t_max_constrict);
   [h, p2, ci, stats] = ttest2(ey_female(tp).d(2).t_max_constrict, en_female(tp).d(2).t_max_constrict);
   [h, p3, ci, stats] = ttest2(ey_female(tp).d(3).t_max_constrict, en_female(tp).d(3).t_max_constrict);
   table_female_export(tp).stats{2,7} = num2str([num2str(p1, '%4.3f') ',' num2str(p2, '%4.3f') ',' num2str(p3, '%4.3f')]);

   table_female_export(tp).stats{3,1} = num2str([num2str(table_female(tp).stats{1,16}, '%4.2f') ', ' num2str(table_female(tp).stats{2,16}, '%4.2f') ', ' num2str(table_female(tp).stats{3,16}, '%4.2f')]);
   table_female_export(tp).stats{3,2} = num2str([num2str(table_female(tp).stats{1,17}, '%4.2f') ', ' num2str(table_female(tp).stats{2,17}, '%4.2f') ', ' num2str(table_female(tp).stats{3,17}, '%4.2f')]);
   table_female_export(tp).stats{3,3} = num2str([num2str(table_female(tp).stats{1,14}, '%4.2f') ', ' num2str(table_female(tp).stats{2,14}, '%4.2f') ', ' num2str(table_female(tp).stats{3,14}, '%4.2f')]);
   table_female_export(tp).stats{3,4} = num2str([num2str(table_female(tp).stats{1,15}, '%4.2f') ', ' num2str(table_female(tp).stats{2,15}, '%4.2f') ', ' num2str(table_female(tp).stats{3,15}, '%4.2f')]);
   table_female_export(tp).stats{3,5} = num2str([num2str(table_female(tp).stats{1,18}, '%4.2f') ', ' num2str(table_female(tp).stats{2,18}, '%4.2f') ', ' num2str(table_female(tp).stats{3,18}, '%4.2f')]);
   table_female_export(tp).stats{3,6} = num2str([num2str(table_female(tp).stats{1,19}, '%4.2f') ', ' num2str(table_female(tp).stats{2,19}, '%4.2f') ', ' num2str(table_female(tp).stats{3,19}, '%4.2f')]);
   [h, p1, ci, stats] = ttest2(ey_female(tp).d(1).max_con_vel, en_female(tp).d(1).max_con_vel);
   [h, p2, ci, stats] = ttest2(ey_female(tp).d(2).max_con_vel, en_female(tp).d(2).max_con_vel);
   [h, p3, ci, stats] = ttest2(ey_female(tp).d(3).max_con_vel, en_female(tp).d(3).max_con_vel);
   table_female_export(tp).stats{3,7} = num2str([num2str(p1, '%4.3f') ',' num2str(p2, '%4.3f') ',' num2str(p3, '%4.3f')]);

   table_female_export(tp).stats{4,1} = num2str([num2str(table_female(tp).stats{1,22}, '%4.2f') ', ' num2str(table_female(tp).stats{2,22}, '%4.2f') ', ' num2str(table_female(tp).stats{3,22}, '%4.2f')]);
   table_female_export(tp).stats{4,2} = num2str([num2str(table_female(tp).stats{1,23}, '%4.2f') ', ' num2str(table_female(tp).stats{2,23}, '%4.2f') ', ' num2str(table_female(tp).stats{3,23}, '%4.2f')]);
   table_female_export(tp).stats{4,3} = num2str([num2str(table_female(tp).stats{1,20}, '%4.2f') ', ' num2str(table_female(tp).stats{2,20}, '%4.2f') ', ' num2str(table_female(tp).stats{3,20}, '%4.2f')]);
   table_female_export(tp).stats{4,4} = num2str([num2str(table_female(tp).stats{1,21}, '%4.2f') ', ' num2str(table_female(tp).stats{2,21}, '%4.2f') ', ' num2str(table_female(tp).stats{3,21}, '%4.2f')]);
   table_female_export(tp).stats{4,5} = num2str([num2str(table_female(tp).stats{1,24}, '%4.2f') ', ' num2str(table_female(tp).stats{2,24}, '%4.2f') ', ' num2str(table_female(tp).stats{3,24}, '%4.2f')]);
   table_female_export(tp).stats{4,6} = num2str([num2str(table_female(tp).stats{1,25}, '%4.2f') ', ' num2str(table_female(tp).stats{2,25}, '%4.2f') ', ' num2str(table_female(tp).stats{3,25}, '%4.2f')]);
   [h, p1, ci, stats] = ttest2(ey_female(tp).d(1).t_max_con_vel, en_female(tp).d(1).t_max_con_vel);
   [h, p2, ci, stats] = ttest2(ey_female(tp).d(2).t_max_con_vel, en_female(tp).d(2).t_max_con_vel);
   [h, p3, ci, stats] = ttest2(ey_female(tp).d(3).t_max_con_vel, en_female(tp).d(3).t_max_con_vel);
   table_female_export(tp).stats{4,7} = num2str([num2str(p1, '%4.3f') ',' num2str(p2, '%4.3f') ',' num2str(p3, '%4.3f')]);

   table_female_export(tp).stats{5,1} = num2str([num2str(table_female(tp).stats{1,28}, '%4.2f') ', ' num2str(table_female(tp).stats{2,28}, '%4.2f') ', ' num2str(table_female(tp).stats{3,28}, '%4.2f')]);
   table_female_export(tp).stats{5,2} = num2str([num2str(table_female(tp).stats{1,29}, '%4.2f') ', ' num2str(table_female(tp).stats{2,29}, '%4.2f') ', ' num2str(table_female(tp).stats{3,29}, '%4.2f')]);
   table_female_export(tp).stats{5,3} = num2str([num2str(table_female(tp).stats{1,26}, '%4.2f') ', ' num2str(table_female(tp).stats{2,26}, '%4.2f') ', ' num2str(table_female(tp).stats{3,26}, '%4.2f')]);
   table_female_export(tp).stats{5,4} = num2str([num2str(table_female(tp).stats{1,27}, '%4.2f') ', ' num2str(table_female(tp).stats{2,27}, '%4.2f') ', ' num2str(table_female(tp).stats{3,27}, '%4.2f')]);
   table_female_export(tp).stats{5,5} = num2str([num2str(table_female(tp).stats{1,30}, '%4.2f') ', ' num2str(table_female(tp).stats{2,30}, '%4.2f') ', ' num2str(table_female(tp).stats{3,30}, '%4.2f')]);
   table_female_export(tp).stats{5,6} = num2str([num2str(table_female(tp).stats{1,31}, '%4.2f') ', ' num2str(table_female(tp).stats{2,31}, '%4.2f') ', ' num2str(table_female(tp).stats{3,31}, '%4.2f')]);
   [h, p1, ci, stats] = ttest2(ey_female(tp).d(1).max_dil_vel, en_female(tp).d(1).max_dil_vel);
   [h, p2, ci, stats] = ttest2(ey_female(tp).d(2).max_dil_vel, en_female(tp).d(2).max_dil_vel);
   [h, p3, ci, stats] = ttest2(ey_female(tp).d(3).max_dil_vel, en_female(tp).d(3).max_dil_vel);
   table_female_export(tp).stats{5,7} = num2str([num2str(p1, '%4.3f') ',' num2str(p2, '%4.3f') ',' num2str(p3, '%4.3f')]);

   table_female_export(tp).stats{6,1} = num2str([num2str(table_female(tp).stats{1,34}, '%4.2f') ', ' num2str(table_female(tp).stats{2,34}, '%4.2f') ', ' num2str(table_female(tp).stats{3,34}, '%4.2f')]);
   table_female_export(tp).stats{6,2} = num2str([num2str(table_female(tp).stats{1,35}, '%4.2f') ', ' num2str(table_female(tp).stats{2,35}, '%4.2f') ', ' num2str(table_female(tp).stats{3,35}, '%4.2f')]);
   table_female_export(tp).stats{6,3} = num2str([num2str(table_female(tp).stats{1,32}, '%4.2f') ', ' num2str(table_female(tp).stats{2,32}, '%4.2f') ', ' num2str(table_female(tp).stats{3,32}, '%4.2f')]);
   table_female_export(tp).stats{6,4} = num2str([num2str(table_female(tp).stats{1,33}, '%4.2f') ', ' num2str(table_female(tp).stats{2,33}, '%4.2f') ', ' num2str(table_female(tp).stats{3,33}, '%4.2f')]);
   table_female_export(tp).stats{6,5} = num2str([num2str(table_female(tp).stats{1,36}, '%4.2f') ', ' num2str(table_female(tp).stats{2,36}, '%4.2f') ', ' num2str(table_female(tp).stats{3,36}, '%4.2f')]);
   table_female_export(tp).stats{6,6} = num2str([num2str(table_female(tp).stats{1,37}, '%4.2f') ', ' num2str(table_female(tp).stats{2,37}, '%4.2f') ', ' num2str(table_female(tp).stats{3,37}, '%4.2f')]);
   [h, p1, ci, stats] = ttest2(ey_female(tp).d(1).t_max_dil_vel, en_female(tp).d(1).t_max_dil_vel);
   [h, p2, ci, stats] = ttest2(ey_female(tp).d(2).t_max_dil_vel, en_female(tp).d(2).t_max_dil_vel);
   [h, p3, ci, stats] = ttest2(ey_female(tp).d(3).t_max_dil_vel, en_female(tp).d(3).t_max_dil_vel);
   table_female_export(tp).stats{6,7} = num2str([num2str(p1, '%4.3f') ',' num2str(p2, '%4.3f') ',' num2str(p3, '%4.3f')]);

   table_female_export(tp).stats{7,1} = num2str([num2str(table_female(tp).stats{1,40}, '%4.2f') ', ' num2str(table_female(tp).stats{2,40}, '%4.2f') ', ' num2str(table_female(tp).stats{3,40}, '%4.2f')]);
   table_female_export(tp).stats{7,2} = num2str([num2str(table_female(tp).stats{1,41}, '%4.2f') ', ' num2str(table_female(tp).stats{2,41}, '%4.2f') ', ' num2str(table_female(tp).stats{3,41}, '%4.2f')]);
   table_female_export(tp).stats{7,3} = num2str([num2str(table_female(tp).stats{1,38}, '%4.2f') ', ' num2str(table_female(tp).stats{2,38}, '%4.2f') ', ' num2str(table_female(tp).stats{3,38}, '%4.2f')]);
   table_female_export(tp).stats{7,4} = num2str([num2str(table_female(tp).stats{1,39}, '%4.2f') ', ' num2str(table_female(tp).stats{2,39}, '%4.2f') ', ' num2str(table_female(tp).stats{3,39}, '%4.2f')]);
   table_female_export(tp).stats{7,5} = num2str([num2str(table_female(tp).stats{1,42}, '%4.2f') ', ' num2str(table_female(tp).stats{2,42}, '%4.2f') ', ' num2str(table_female(tp).stats{3,42}, '%4.2f')]);
   table_female_export(tp).stats{7,6} = num2str([num2str(table_female(tp).stats{1,43}, '%4.2f') ', ' num2str(table_female(tp).stats{2,43}, '%4.2f') ', ' num2str(table_female(tp).stats{3,43}, '%4.2f')]);
   [h, p1, ci, stats] = ttest2(ey_female(tp).d(1).T75, en_female(tp).d(1).T75);
   [h, p2, ci, stats] = ttest2(ey_female(tp).d(2).T75, en_female(tp).d(2).T75);
   [h, p3, ci, stats] = ttest2(ey_female(tp).d(3).T75, en_female(tp).d(3).T75);
   table_female_export(tp).stats{7,7} = num2str([num2str(p1, '%4.3f') ',' num2str(p2, '%4.3f') ',' num2str(p3, '%4.3f')]);


   table_female_export(tp).stats{8,1} = num2str([num2str(table_female(tp).stats{1,46}, '%4.2f') ', ' num2str(table_female(tp).stats{2,46}, '%4.2f') ', ' num2str(table_female(tp).stats{3,46}, '%4.2f')]);
   table_female_export(tp).stats{8,2} = num2str([num2str(table_female(tp).stats{1,47}, '%4.2f') ', ' num2str(table_female(tp).stats{2,47}, '%4.2f') ', ' num2str(table_female(tp).stats{3,47}, '%4.2f')]);
   table_female_export(tp).stats{8,3} = num2str([num2str(table_female(tp).stats{1,44}, '%4.2f') ', ' num2str(table_female(tp).stats{2,44}, '%4.2f') ', ' num2str(table_female(tp).stats{3,44}, '%4.2f')]);
   table_female_export(tp).stats{8,4} = num2str([num2str(table_female(tp).stats{1,45}, '%4.2f') ', ' num2str(table_female(tp).stats{2,45}, '%4.2f') ', ' num2str(table_female(tp).stats{3,45}, '%4.2f')]);
   table_female_export(tp).stats{8,5} = num2str([num2str(table_female(tp).stats{1,48}, '%4.2f') ', ' num2str(table_female(tp).stats{2,48}, '%4.2f') ', ' num2str(table_female(tp).stats{3,48}, '%4.2f')]);
   table_female_export(tp).stats{8,6} = num2str([num2str(table_female(tp).stats{1,49}, '%4.2f') ', ' num2str(table_female(tp).stats{2,49}, '%4.2f') ', ' num2str(table_female(tp).stats{3,49}, '%4.2f')]);
   [h, p1, ci, stats] = ttest2(ey_female(tp).d(1).avg_con_vel, en_female(tp).d(1).avg_con_vel);
   [h, p2, ci, stats] = ttest2(ey_female(tp).d(2).avg_con_vel, en_female(tp).d(2).avg_con_vel);
   [h, p3, ci, stats] = ttest2(ey_female(tp).d(3).avg_con_vel, en_female(tp).d(3).avg_con_vel);
   table_female_export(tp).stats{8,7} = num2str([num2str(p1, '%4.3f') ',' num2str(p2, '%4.3f') ',' num2str(p3, '%4.3f')]);


   table_female_export(tp).stats{9,1} = num2str([num2str(table_female(tp).stats{1,52}, '%4.2f') ', ' num2str(table_female(tp).stats{2,52}, '%4.2f') ', ' num2str(table_female(tp).stats{3,52}, '%4.2f')]);
   table_female_export(tp).stats{9,2} = num2str([num2str(table_female(tp).stats{1,53}, '%4.2f') ', ' num2str(table_female(tp).stats{2,53}, '%4.2f') ', ' num2str(table_female(tp).stats{3,53}, '%4.2f')]);
   table_female_export(tp).stats{9,3} = num2str([num2str(table_female(tp).stats{1,50}, '%4.2f') ', ' num2str(table_female(tp).stats{2,50}, '%4.2f') ', ' num2str(table_female(tp).stats{3,50}, '%4.2f')]);
   table_female_export(tp).stats{9,4} = num2str([num2str(table_female(tp).stats{1,51}, '%4.2f') ', ' num2str(table_female(tp).stats{2,51}, '%4.2f') ', ' num2str(table_female(tp).stats{3,51}, '%4.2f')]);
   table_female_export(tp).stats{9,5} = num2str([num2str(table_female(tp).stats{1,54}, '%4.2f') ', ' num2str(table_female(tp).stats{2,54}, '%4.2f') ', ' num2str(table_female(tp).stats{3,54}, '%4.2f')]);
   table_female_export(tp).stats{9,6} = num2str([num2str(table_female(tp).stats{1,55}, '%4.2f') ', ' num2str(table_female(tp).stats{2,55}, '%4.2f') ', ' num2str(table_female(tp).stats{3,55}, '%4.2f')]);
   [h, p1, ci, stats] = ttest2(ey_female(tp).d(1).avg_dil_vel, en_female(tp).d(1).avg_dil_vel);
   [h, p2, ci, stats] = ttest2(ey_female(tp).d(2).avg_dil_vel, en_female(tp).d(2).avg_dil_vel);
   [h, p3, ci, stats] = ttest2(ey_female(tp).d(3).avg_dil_vel, en_female(tp).d(3).avg_dil_vel);
   table_female_export(tp).stats{9,7} = num2str([num2str(p1, '%4.3f') ',' num2str(p2, '%4.3f') ',' num2str(p3, '%4.3f')]);

   table_female_export(tp).stats{10,1} = num2str([num2str(table_female(tp).stats{1,58}, '%4.2f') ', ' num2str(table_female(tp).stats{2,58}, '%4.2f') ', ' num2str(table_female(tp).stats{3,58}, '%4.2f')]);
   table_female_export(tp).stats{10,2} = num2str([num2str(table_female(tp).stats{1,59}, '%4.2f') ', ' num2str(table_female(tp).stats{2,59}, '%4.2f') ', ' num2str(table_female(tp).stats{3,59}, '%4.2f')]);
   table_female_export(tp).stats{10,3} = num2str([num2str(table_female(tp).stats{1,56}, '%4.2f') ', ' num2str(table_female(tp).stats{2,56}, '%4.2f') ', ' num2str(table_female(tp).stats{3,56}, '%4.2f')]);
   table_female_export(tp).stats{10,4} = num2str([num2str(table_female(tp).stats{1,57}, '%4.2f') ', ' num2str(table_female(tp).stats{2,57}, '%4.2f') ', ' num2str(table_female(tp).stats{3,57}, '%4.2f')]);
   table_female_export(tp).stats{10,5} = num2str([num2str(table_female(tp).stats{1,60}, '%4.2f') ', ' num2str(table_female(tp).stats{2,60}, '%4.2f') ', ' num2str(table_female(tp).stats{3,60}, '%4.2f')]);
   table_female_export(tp).stats{10,6} = num2str([num2str(table_female(tp).stats{1,61}, '%4.2f') ', ' num2str(table_female(tp).stats{2,61}, '%4.2f') ', ' num2str(table_female(tp).stats{3,61}, '%4.2f')]);
   [h, p1, ci, stats] = ttest2(ey_female(tp).d(1).min_constrict, en_female(tp).d(1).min_constrict);
   [h, p2, ci, stats] = ttest2(ey_female(tp).d(2).min_constrict, en_female(tp).d(2).min_constrict);
   [h, p3, ci, stats] = ttest2(ey_female(tp).d(3).min_constrict, en_female(tp).d(3).min_constrict);
   table_female_export(tp).stats{10,7} = num2str([num2str(p1, '%4.3f') ',' num2str(p2, '%4.3f') ',' num2str(p3, '%4.3f')]);


end

table_female_export2 = array2table(table_female_export)
ritecell(table_female_export2.table_female_export1.stats, 'female_table.csv')


for tp = 1:4

   % Max Constrict
   table_male_export(tp).stats{1,1} = num2str([num2str(table_male(tp).stats{1,4}, '%4.2f') ', ' num2str(table_male(tp).stats{2,4}, '%4.2f') ', ' num2str(table_male(tp).stats{3,4}, '%4.2f')]);
   table_male_export(tp).stats{1,2} = num2str([num2str(table_male(tp).stats{1,5}, '%4.2f') ', ' num2str(table_male(tp).stats{2,5}, '%4.2f') ', ' num2str(table_male(tp).stats{3,5}, '%4.2f')]);
   table_male_export(tp).stats{1,3} = num2str([num2str(table_male(tp).stats{1,2}, '%4.2f') ', ' num2str(table_male(tp).stats{2,2}, '%4.2f') ', ' num2str(table_male(tp).stats{3,2}, '%4.2f')]);
   table_male_export(tp).stats{1,4} = num2str([num2str(table_male(tp).stats{1,3}, '%4.2f') ', ' num2str(table_male(tp).stats{2,3}, '%4.2f') ', ' num2str(table_male(tp).stats{3,3}, '%4.2f')]);
   table_male_export(tp).stats{1,5} = num2str([num2str(table_male(tp).stats{1,6}, '%4.2f') ', ' num2str(table_male(tp).stats{2,6}, '%4.2f') ', ' num2str(table_male(tp).stats{3,6}, '%4.2f')]);
   table_male_export(tp).stats{1,6} = num2str([num2str(table_male(tp).stats{1,7}, '%4.2f') ', ' num2str(table_male(tp).stats{2,7}, '%4.2f') ', ' num2str(table_male(tp).stats{3,7}, '%4.2f')]);
   [h, p1, ci, stats] = ttest2(ey_male(tp).d(1).max_constrict, en_male(tp).d(1).max_constrict);
   [h, p2, ci, stats] = ttest2(ey_male(tp).d(2).max_constrict, en_male(tp).d(2).max_constrict);
   [h, p3, ci, stats] = ttest2(ey_male(tp).d(3).max_constrict, en_male(tp).d(3).max_constrict);
   table_male_export(tp).stats{1,7} = num2str([num2str(p1, '%4.3f') ',' num2str(p2, '%4.3f') ',' num2str(p3, '%4.3f')]);

   % T_Max_Constrict
   table_male_export(tp).stats{2,1} = num2str([num2str(table_male(tp).stats{1,10}, '%4.2f') ', ' num2str(table_male(tp).stats{2,10}, '%4.2f') ', ' num2str(table_male(tp).stats{3,10}, '%4.2f')]);
   table_male_export(tp).stats{2,2} = num2str([num2str(table_male(tp).stats{1,11}, '%4.2f') ', ' num2str(table_male(tp).stats{2,11}, '%4.2f') ', ' num2str(table_male(tp).stats{3,11}, '%4.2f')]);
   table_male_export(tp).stats{2,3} = num2str([num2str(table_male(tp).stats{1,8},  '%4.2f') ', ' num2str(table_male(tp).stats{2,8},  '%4.2f') ', ' num2str(table_male(tp).stats{3,8}, '%4.2f')]);
   table_male_export(tp).stats{2,4} = num2str([num2str(table_male(tp).stats{1,9},  '%4.2f') ', ' num2str(table_male(tp).stats{2,9},  '%4.2f') ', ' num2str(table_male(tp).stats{3,9}, '%4.2f')]);
   table_male_export(tp).stats{2,5} = num2str([num2str(table_male(tp).stats{1,12}, '%4.2f') ', ' num2str(table_male(tp).stats{2,12}, '%4.2f') ', ' num2str(table_male(tp).stats{3,12}, '%4.2f')]);
   table_male_export(tp).stats{2,6} = num2str([num2str(table_male(tp).stats{1,13}, '%4.2f') ', ' num2str(table_male(tp).stats{2,13}, '%4.2f') ', ' num2str(table_male(tp).stats{3,13}, '%4.2f')]);
   [h, p1, ci, stats] = ttest2(ey_male(tp).d(1).t_max_constrict, en_male(tp).d(1).t_max_constrict);
   [h, p2, ci, stats] = ttest2(ey_male(tp).d(2).t_max_constrict, en_male(tp).d(2).t_max_constrict);
   [h, p3, ci, stats] = ttest2(ey_male(tp).d(3).t_max_constrict, en_male(tp).d(3).t_max_constrict);
   table_male_export(tp).stats{2,7} = num2str([num2str(p1, '%4.3f') ',' num2str(p2, '%4.3f') ',' num2str(p3, '%4.3f')]);

   table_male_export(tp).stats{3,1} = num2str([num2str(table_male(tp).stats{1,16}, '%4.2f') ', ' num2str(table_male(tp).stats{2,16}, '%4.2f') ', ' num2str(table_male(tp).stats{3,16}, '%4.2f')]);
   table_male_export(tp).stats{3,2} = num2str([num2str(table_male(tp).stats{1,17}, '%4.2f') ', ' num2str(table_male(tp).stats{2,17}, '%4.2f') ', ' num2str(table_male(tp).stats{3,17}, '%4.2f')]);
   table_male_export(tp).stats{3,3} = num2str([num2str(table_male(tp).stats{1,14}, '%4.2f') ', ' num2str(table_male(tp).stats{2,14}, '%4.2f') ', ' num2str(table_male(tp).stats{3,14}, '%4.2f')]);
   table_male_export(tp).stats{3,4} = num2str([num2str(table_male(tp).stats{1,15}, '%4.2f') ', ' num2str(table_male(tp).stats{2,15}, '%4.2f') ', ' num2str(table_male(tp).stats{3,15}, '%4.2f')]);
   table_male_export(tp).stats{3,5} = num2str([num2str(table_male(tp).stats{1,18}, '%4.2f') ', ' num2str(table_male(tp).stats{2,18}, '%4.2f') ', ' num2str(table_male(tp).stats{3,18}, '%4.2f')]);
   table_male_export(tp).stats{3,6} = num2str([num2str(table_male(tp).stats{1,19}, '%4.2f') ', ' num2str(table_male(tp).stats{2,19}, '%4.2f') ', ' num2str(table_male(tp).stats{3,19}, '%4.2f')]);
   [h, p1, ci, stats] = ttest2(ey_male(tp).d(1).max_con_vel, en_male(tp).d(1).max_con_vel);
   [h, p2, ci, stats] = ttest2(ey_male(tp).d(2).max_con_vel, en_male(tp).d(2).max_con_vel);
   [h, p3, ci, stats] = ttest2(ey_male(tp).d(3).max_con_vel, en_male(tp).d(3).max_con_vel);
   table_male_export(tp).stats{3,7} = num2str([num2str(p1, '%4.3f') ',' num2str(p2, '%4.3f') ',' num2str(p3, '%4.3f')]);

   table_male_export(tp).stats{4,1} = num2str([num2str(table_male(tp).stats{1,22}, '%4.2f') ', ' num2str(table_male(tp).stats{2,22}, '%4.2f') ', ' num2str(table_male(tp).stats{3,22}, '%4.2f')]);
   table_male_export(tp).stats{4,2} = num2str([num2str(table_male(tp).stats{1,23}, '%4.2f') ', ' num2str(table_male(tp).stats{2,23}, '%4.2f') ', ' num2str(table_male(tp).stats{3,23}, '%4.2f')]);
   table_male_export(tp).stats{4,3} = num2str([num2str(table_male(tp).stats{1,20}, '%4.2f') ', ' num2str(table_male(tp).stats{2,20}, '%4.2f') ', ' num2str(table_male(tp).stats{3,20}, '%4.2f')]);
   table_male_export(tp).stats{4,4} = num2str([num2str(table_male(tp).stats{1,21}, '%4.2f') ', ' num2str(table_male(tp).stats{2,21}, '%4.2f') ', ' num2str(table_male(tp).stats{3,21}, '%4.2f')]);
   table_male_export(tp).stats{4,5} = num2str([num2str(table_male(tp).stats{1,24}, '%4.2f') ', ' num2str(table_male(tp).stats{2,24}, '%4.2f') ', ' num2str(table_male(tp).stats{3,24}, '%4.2f')]);
   table_male_export(tp).stats{4,6} = num2str([num2str(table_male(tp).stats{1,25}, '%4.2f') ', ' num2str(table_male(tp).stats{2,25}, '%4.2f') ', ' num2str(table_male(tp).stats{3,25}, '%4.2f')]);
   [h, p1, ci, stats] = ttest2(ey_male(tp).d(1).t_max_con_vel, en_male(tp).d(1).t_max_con_vel);
   [h, p2, ci, stats] = ttest2(ey_male(tp).d(2).t_max_con_vel, en_male(tp).d(2).t_max_con_vel);
   [h, p3, ci, stats] = ttest2(ey_male(tp).d(3).t_max_con_vel, en_male(tp).d(3).t_max_con_vel);
   table_male_export(tp).stats{4,7} = num2str([num2str(p1, '%4.3f') ',' num2str(p2, '%4.3f') ',' num2str(p3, '%4.3f')]);

   table_male_export(tp).stats{5,1} = num2str([num2str(table_male(tp).stats{1,28}, '%4.2f') ', ' num2str(table_male(tp).stats{2,28}, '%4.2f') ', ' num2str(table_male(tp).stats{3,28}, '%4.2f')]);
   table_male_export(tp).stats{5,2} = num2str([num2str(table_male(tp).stats{1,29}, '%4.2f') ', ' num2str(table_male(tp).stats{2,29}, '%4.2f') ', ' num2str(table_male(tp).stats{3,29}, '%4.2f')]);
   table_male_export(tp).stats{5,3} = num2str([num2str(table_male(tp).stats{1,26}, '%4.2f') ', ' num2str(table_male(tp).stats{2,26}, '%4.2f') ', ' num2str(table_male(tp).stats{3,26}, '%4.2f')]);
   table_male_export(tp).stats{5,4} = num2str([num2str(table_male(tp).stats{1,27}, '%4.2f') ', ' num2str(table_male(tp).stats{2,27}, '%4.2f') ', ' num2str(table_male(tp).stats{3,27}, '%4.2f')]);
   table_male_export(tp).stats{5,5} = num2str([num2str(table_male(tp).stats{1,30}, '%4.2f') ', ' num2str(table_male(tp).stats{2,30}, '%4.2f') ', ' num2str(table_male(tp).stats{3,30}, '%4.2f')]);
   table_male_export(tp).stats{5,6} = num2str([num2str(table_male(tp).stats{1,31}, '%4.2f') ', ' num2str(table_male(tp).stats{2,31}, '%4.2f') ', ' num2str(table_male(tp).stats{3,31}, '%4.2f')]);
   [h, p1, ci, stats] = ttest2(ey_male(tp).d(1).max_dil_vel, en_male(tp).d(1).max_dil_vel);
   [h, p2, ci, stats] = ttest2(ey_male(tp).d(2).max_dil_vel, en_male(tp).d(2).max_dil_vel);
   [h, p3, ci, stats] = ttest2(ey_male(tp).d(3).max_dil_vel, en_male(tp).d(3).max_dil_vel);
   table_male_export(tp).stats{5,7} = num2str([num2str(p1, '%4.3f') ',' num2str(p2, '%4.3f') ',' num2str(p3, '%4.3f')]);

   table_male_export(tp).stats{6,1} = num2str([num2str(table_male(tp).stats{1,34}, '%4.2f') ', ' num2str(table_male(tp).stats{2,34}, '%4.2f') ', ' num2str(table_male(tp).stats{3,34}, '%4.2f')]);
   table_male_export(tp).stats{6,2} = num2str([num2str(table_male(tp).stats{1,35}, '%4.2f') ', ' num2str(table_male(tp).stats{2,35}, '%4.2f') ', ' num2str(table_male(tp).stats{3,35}, '%4.2f')]);
   table_male_export(tp).stats{6,3} = num2str([num2str(table_male(tp).stats{1,32}, '%4.2f') ', ' num2str(table_male(tp).stats{2,32}, '%4.2f') ', ' num2str(table_male(tp).stats{3,32}, '%4.2f')]);
   table_male_export(tp).stats{6,4} = num2str([num2str(table_male(tp).stats{1,33}, '%4.2f') ', ' num2str(table_male(tp).stats{2,33}, '%4.2f') ', ' num2str(table_male(tp).stats{3,33}, '%4.2f')]);
   table_male_export(tp).stats{6,5} = num2str([num2str(table_male(tp).stats{1,36}, '%4.2f') ', ' num2str(table_male(tp).stats{2,36}, '%4.2f') ', ' num2str(table_male(tp).stats{3,36}, '%4.2f')]);
   table_male_export(tp).stats{6,6} = num2str([num2str(table_male(tp).stats{1,37}, '%4.2f') ', ' num2str(table_male(tp).stats{2,37}, '%4.2f') ', ' num2str(table_male(tp).stats{3,37}, '%4.2f')]);
   [h, p1, ci, stats] = ttest2(ey_male(tp).d(1).t_max_dil_vel, en_male(tp).d(1).t_max_dil_vel);
   [h, p2, ci, stats] = ttest2(ey_male(tp).d(2).t_max_dil_vel, en_male(tp).d(2).t_max_dil_vel);
   [h, p3, ci, stats] = ttest2(ey_male(tp).d(3).t_max_dil_vel, en_male(tp).d(3).t_max_dil_vel);
   table_male_export(tp).stats{6,7} = num2str([num2str(p1, '%4.3f') ',' num2str(p2, '%4.3f') ',' num2str(p3, '%4.3f')]);

   table_male_export(tp).stats{7,1} = num2str([num2str(table_male(tp).stats{1,40}, '%4.2f') ', ' num2str(table_male(tp).stats{2,40}, '%4.2f') ', ' num2str(table_male(tp).stats{3,40}, '%4.2f')]);
   table_male_export(tp).stats{7,2} = num2str([num2str(table_male(tp).stats{1,41}, '%4.2f') ', ' num2str(table_male(tp).stats{2,41}, '%4.2f') ', ' num2str(table_male(tp).stats{3,41}, '%4.2f')]);
   table_male_export(tp).stats{7,3} = num2str([num2str(table_male(tp).stats{1,38}, '%4.2f') ', ' num2str(table_male(tp).stats{2,38}, '%4.2f') ', ' num2str(table_male(tp).stats{3,38}, '%4.2f')]);
   table_male_export(tp).stats{7,4} = num2str([num2str(table_male(tp).stats{1,39}, '%4.2f') ', ' num2str(table_male(tp).stats{2,39}, '%4.2f') ', ' num2str(table_male(tp).stats{3,39}, '%4.2f')]);
   table_male_export(tp).stats{7,5} = num2str([num2str(table_male(tp).stats{1,42}, '%4.2f') ', ' num2str(table_male(tp).stats{2,42}, '%4.2f') ', ' num2str(table_male(tp).stats{3,42}, '%4.2f')]);
   table_male_export(tp).stats{7,6} = num2str([num2str(table_male(tp).stats{1,43}, '%4.2f') ', ' num2str(table_male(tp).stats{2,43}, '%4.2f') ', ' num2str(table_male(tp).stats{3,43}, '%4.2f')]);
   [h, p1, ci, stats] = ttest2(ey_male(tp).d(1).T75, en_male(tp).d(1).T75);
   [h, p2, ci, stats] = ttest2(ey_male(tp).d(2).T75, en_male(tp).d(2).T75);
   [h, p3, ci, stats] = ttest2(ey_male(tp).d(3).T75, en_male(tp).d(3).T75);
   table_male_export(tp).stats{7,7} = num2str([num2str(p1, '%4.3f') ',' num2str(p2, '%4.3f') ',' num2str(p3, '%4.3f')]);


   table_male_export(tp).stats{8,1} = num2str([num2str(table_male(tp).stats{1,46}, '%4.2f') ', ' num2str(table_male(tp).stats{2,46}, '%4.2f') ', ' num2str(table_male(tp).stats{3,46}, '%4.2f')]);
   table_male_export(tp).stats{8,2} = num2str([num2str(table_male(tp).stats{1,47}, '%4.2f') ', ' num2str(table_male(tp).stats{2,47}, '%4.2f') ', ' num2str(table_male(tp).stats{3,47}, '%4.2f')]);
   table_male_export(tp).stats{8,3} = num2str([num2str(table_male(tp).stats{1,44}, '%4.2f') ', ' num2str(table_male(tp).stats{2,44}, '%4.2f') ', ' num2str(table_male(tp).stats{3,44}, '%4.2f')]);
   table_male_export(tp).stats{8,4} = num2str([num2str(table_male(tp).stats{1,45}, '%4.2f') ', ' num2str(table_male(tp).stats{2,45}, '%4.2f') ', ' num2str(table_male(tp).stats{3,45}, '%4.2f')]);
   table_male_export(tp).stats{8,5} = num2str([num2str(table_male(tp).stats{1,48}, '%4.2f') ', ' num2str(table_male(tp).stats{2,48}, '%4.2f') ', ' num2str(table_male(tp).stats{3,48}, '%4.2f')]);
   table_male_export(tp).stats{8,6} = num2str([num2str(table_male(tp).stats{1,49}, '%4.2f') ', ' num2str(table_male(tp).stats{2,49}, '%4.2f') ', ' num2str(table_male(tp).stats{3,49}, '%4.2f')]);
   [h, p1, ci, stats] = ttest2(ey_male(tp).d(1).avg_con_vel, en_male(tp).d(1).avg_con_vel);
   [h, p2, ci, stats] = ttest2(ey_male(tp).d(2).avg_con_vel, en_male(tp).d(2).avg_con_vel);
   [h, p3, ci, stats] = ttest2(ey_male(tp).d(3).avg_con_vel, en_male(tp).d(3).avg_con_vel);
   table_male_export(tp).stats{8,7} = num2str([num2str(p1, '%4.3f') ',' num2str(p2, '%4.3f') ',' num2str(p3, '%4.3f')]);


   table_male_export(tp).stats{9,1} = num2str([num2str(table_male(tp).stats{1,52}, '%4.2f') ', ' num2str(table_male(tp).stats{2,52}, '%4.2f') ', ' num2str(table_male(tp).stats{3,52}, '%4.2f')]);
   table_male_export(tp).stats{9,2} = num2str([num2str(table_male(tp).stats{1,53}, '%4.2f') ', ' num2str(table_male(tp).stats{2,53}, '%4.2f') ', ' num2str(table_male(tp).stats{3,53}, '%4.2f')]);
   table_male_export(tp).stats{9,3} = num2str([num2str(table_male(tp).stats{1,50}, '%4.2f') ', ' num2str(table_male(tp).stats{2,50}, '%4.2f') ', ' num2str(table_male(tp).stats{3,50}, '%4.2f')]);
   table_male_export(tp).stats{9,4} = num2str([num2str(table_male(tp).stats{1,51}, '%4.2f') ', ' num2str(table_male(tp).stats{2,51}, '%4.2f') ', ' num2str(table_male(tp).stats{3,51}, '%4.2f')]);
   table_male_export(tp).stats{9,5} = num2str([num2str(table_male(tp).stats{1,54}, '%4.2f') ', ' num2str(table_male(tp).stats{2,54}, '%4.2f') ', ' num2str(table_male(tp).stats{3,54}, '%4.2f')]);
   table_male_export(tp).stats{9,6} = num2str([num2str(table_male(tp).stats{1,55}, '%4.2f') ', ' num2str(table_male(tp).stats{2,55}, '%4.2f') ', ' num2str(table_male(tp).stats{3,55}, '%4.2f')]);
   [h, p1, ci, stats] = ttest2(ey_male(tp).d(1).avg_dil_vel, en_male(tp).d(1).avg_dil_vel);
   [h, p2, ci, stats] = ttest2(ey_male(tp).d(2).avg_dil_vel, en_male(tp).d(2).avg_dil_vel);
   [h, p3, ci, stats] = ttest2(ey_male(tp).d(3).avg_dil_vel, en_male(tp).d(3).avg_dil_vel);
   table_male_export(tp).stats{9,7} = num2str([num2str(p1, '%4.3f') ',' num2str(p2, '%4.3f') ',' num2str(p3, '%4.3f')]);

   table_male_export(tp).stats{10,1} = num2str([num2str(table_male(tp).stats{1,58}, '%4.2f') ', ' num2str(table_male(tp).stats{2,58}, '%4.2f') ', ' num2str(table_male(tp).stats{3,58}, '%4.2f')]);
   table_male_export(tp).stats{10,2} = num2str([num2str(table_male(tp).stats{1,59}, '%4.2f') ', ' num2str(table_male(tp).stats{2,59}, '%4.2f') ', ' num2str(table_male(tp).stats{3,59}, '%4.2f')]);
   table_male_export(tp).stats{10,3} = num2str([num2str(table_male(tp).stats{1,56}, '%4.2f') ', ' num2str(table_male(tp).stats{2,56}, '%4.2f') ', ' num2str(table_male(tp).stats{3,56}, '%4.2f')]);
   table_male_export(tp).stats{10,4} = num2str([num2str(table_male(tp).stats{1,57}, '%4.2f') ', ' num2str(table_male(tp).stats{2,57}, '%4.2f') ', ' num2str(table_male(tp).stats{3,57}, '%4.2f')]);
   table_male_export(tp).stats{10,5} = num2str([num2str(table_male(tp).stats{1,60}, '%4.2f') ', ' num2str(table_male(tp).stats{2,60}, '%4.2f') ', ' num2str(table_male(tp).stats{3,60}, '%4.2f')]);
   table_male_export(tp).stats{10,6} = num2str([num2str(table_male(tp).stats{1,61}, '%4.2f') ', ' num2str(table_male(tp).stats{2,61}, '%4.2f') ', ' num2str(table_male(tp).stats{3,61}, '%4.2f')]);
   [h, p1, ci, stats] = ttest2(ey_male(tp).d(1).min_constrict, en_male(tp).d(1).min_constrict);
   [h, p2, ci, stats] = ttest2(ey_male(tp).d(2).min_constrict, en_male(tp).d(2).min_constrict);
   [h, p3, ci, stats] = ttest2(ey_male(tp).d(3).min_constrict, en_male(tp).d(3).min_constrict);
   table_male_export(tp).stats{10,7} = num2str([num2str(p1, '%4.3f') ',' num2str(p2, '%4.3f') ',' num2str(p3, '%4.3f')]);




end

table_male_export2 = array2table(table_male_export)
writecell(table_male_export2.table_male_export1.stats, 'male_table.csv')