%Figure 1 counts

%sex
sex_data = [sub.sex];

% Get the unique values and their counts
[counts, unique_values] = hist(sex_data, unique(sex_data));

% Display the results
for i = 1:length(unique_values)
    fprintf('Count of ID %d: %d\n', unique_values(i), counts(i));
end

%sport

sport_values = {sub.sport};
count_FB = sum(strcmp(sport_values, 'Football'));
disp(['Number of Football: ', num2str(count_FB)])

count_FH = sum(strcmp(sport_values, 'Field Hockey'));
disp(['Number of Field Hockey: ', num2str(count_FH)])

count_WSoc = sum(strcmp(sport_values, 'WSoc'));
disp(['Number of WSoc: ', num2str(count_WSoc)])

%2 Wrestling spellings so add these together
count_WR = sum(strcmp(sport_values, 'Wrestling'));
disp(['Number of Wrestling: ', num2str(count_WR)])

count_WR2 = sum(strcmp(sport_values, 'Wrestler'));
disp(['Number of Wrestling: ', num2str(count_WR)])
%

count_TF = sum(strcmp(sport_values, 'T&F'));
disp(['Number of Track&Field: ', num2str(count_TF)])

%Water Polo has 2 spellings so add these two together
count_WP = sum(strcmp(sport_values, 'Water Polo'));
disp(['Number of Water Polo: ', num2str(count_WP)])

count_WP2 = sum(strcmp(sport_values, 'Water_Polo'));C
disp(['Number of Water Polo: ', num2str(count_WP)])

%

count_Base = sum(strcmp(sport_values, 'Baseball'));
disp(['Number of Baseball: ', num2str(count_Base)])

count_SB = sum(strcmp(sport_values, 'Softball'));
disp(['Number of Softball: ', num2str(count_SB)])

count_Row = sum(strcmp(sport_values, 'Rowing'));
disp(['Number of Rowing: ', num2str(count_Row)])

count_CH = sum(strcmp(sport_values, 'Cheer'));
disp(['Number of Cheer: ', num2str(count_CH)])

count_SWD = sum(strcmp(sport_values, 'Swimmer'));
disp(['Number of SWD: ', num2str(count_SWD)])


%Age

meanage = nanmean([sub.age]);
disp(['Age Mean: ', num2str(meanage)])
meanage = nanstd([sub.age]);


