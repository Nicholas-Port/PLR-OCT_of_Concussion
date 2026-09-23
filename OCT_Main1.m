% OCT_Main1


dbstop if error

close all;clear all

% Load in the data  - This will give some warnings
T1 = readtable("OCTDatabase");


% Delete extra row - NOTE when more subjects are added, this needs to be
% changed
T1 = T1(1:117,:);

% This subject appears to have a a wrong entry
T1{24,14}= 1;
T1{27,14}= 1;

% This value must be TYPO (was 3332)
T1{70,90} = 332;

% FUBAR
for i = 1:117
   fubar{i,1}=NaN;
end
n_control   = 0;
n_concussed = 0;

%
% Sex needs to be recoded as 1 and 2 (no otheres in this data set = 3)
%
for i = 1:size(T1,1)
   
   if strcmp(T1{i,7},'Female')
      sex(i) = 1;
   elseif strcmp(T1{i,7},'F')
      sex(i) = 1;
   elseif strcmp(T1{i,7},'Male')
      sex(i) = 2;
   elseif strcmp(T1{i,7},'M')
      sex(i) = 2;
   end
   
end


sex = sex';
concussed = strcmp(T1{:,8},'Concussed');


con_i   = find(concussed == 1);
uncon_i = find(concussed == 0);


% We need a parser for subject ID's and we are going to create new
% sequential subject ids
fb(1:100) = NaN;
fh(1:100) = NaN;
sc(1:100) = NaN;
tf(1:100) = NaN;
wp(1:100) = NaN;
wr(1:100) = NaN;

fb_n(1:100) = NaN;
fh_n(1:100) = NaN;
sc_n(1:100) = NaN;
tf_n(1:100) = NaN;
wp_n(1:100) = NaN;
wr_n(1:100) = NaN;

sub_n     = 0;

for i = 1:size(T1,1)
   
   disp(i);
   
   %if i == 75
   %   keyboard
   %end
   
   tc=char(T1{i,2});
   
   % Grab the first two letters to figure out whether we need a third

   
   switch tc(1:2)
      case 'FB'
         n  = tc(4:end);
         ni = str2num(n);
         if isnan(fb(ni))
            fb(ni)   = 1;
            sub_n    = sub_n+1;
            fb_n(ni) = sub_n;
            sub(sub_n).concussed = concussed(i);
            sub(sub_n).sex       = sex(i);
            sub(sub_n).sport     = T1{i,4};
            
            sub(sub_n).visit(T1{i,14}).T1_row        = i;
            sub(sub_n).visit(T1{i,14}).visit         = T1{i,1};
            sub(sub_n).visit(T1{i,14}).ParticipantID = T1{i,2};
            sub(sub_n).visit(T1{i,14}).d_oct         = parse_oct2(T1,i);
            
            fubar{i,1}=sub_n;
            fubar{i,2}=T1{i,2}{1};
            if concussed(i) == 0
               n_control  = n_control + 1;
               fubar{i,3} = n_control;
            else
               n_concussed = n_concussed + 1;
               fubar{i,4}  = n_concussed;
            end
            
            
         elseif ~isnan(fb(ni))
            sub_n2 = fb_n(ni);
            sub(sub_n2).visit(T1{i,14}).T1_row        = i;
            sub(sub_n2).visit(T1{i,14}).visit         = T1{i,1};
            sub(sub_n2).visit(T1{i,14}).ParticipantID = T1{i,2};
            sub(sub_n2).visit(T1{i,14}).d_oct         = parse_oct2(T1,i);
            
            fubar{i,1}=sub_n2;
            fubar{i,2}=T1{i,2}{1};
            
         end
         
      case 'FH'
         n  = tc(4:end);
         ni = str2num(n);
         if isnan(fh(ni))
            fh(ni)   = 1;
            sub_n    = sub_n+1;
            fh_n(ni) = sub_n;
            sub(sub_n).concussed = concussed(i);
            sub(sub_n).sex       = sex(i);
            sub(sub_n).sport     = T1{i,4};
            
            sub(sub_n).visit(T1{i,14}).T1_row        = i;
            sub(sub_n).visit(T1{i,14}).visit         = T1{i,1};
            sub(sub_n).visit(T1{i,14}).ParticipantID = T1{i,2};
            sub(sub_n).visit(T1{i,14}).d_oct         = parse_oct2(T1,i);
            
            fubar{i,1}=sub_n;
            fubar{i,2}=T1{i,2}{1};
            if concussed(i) == 0
               n_control  = n_control + 1;
               fubar{i,3} = n_control;
            else
               n_concussed = n_concussed + 1;
               fubar{i,4}  = n_concussed;
            end
            
         elseif ~isnan(fh(ni))
            sub_n2 = fh_n(ni);
            sub(sub_n2).visit(T1{i,14}).T1_row        = i;
            sub(sub_n2).visit(T1{i,14}).visit         = T1{i,1};
            sub(sub_n2).visit(T1{i,14}).ParticipantID = T1{i,2};
            sub(sub_n2).visit(T1{i,14}).d_oct         = parse_oct2(T1,i);
            
            fubar{i,1}=sub_n2;
            fubar{i,2}=T1{i,2}{1};
            
         end
         
      case 'SC'
         n  = tc(4:end);
         ni = str2num(n);
         
         if isnan(sc(ni))
            sc(ni)   = 1;
            sub_n    = sub_n+1;
            sc_n(ni) = sub_n;
            sub(sub_n).concussed = concussed(i);
            sub(sub_n).sex       = sex(i);
            sub(sub_n).sport     = T1{i,4};
            
            sub(sub_n).visit(T1{i,14}).T1_row        = i;
            sub(sub_n).visit(T1{i,14}).visit         = T1{i,1};
            sub(sub_n).visit(T1{i,14}).ParticipantID = T1{i,2};
            sub(sub_n).visit(T1{i,14}).d_oct         = parse_oct2(T1,i);
            
            fubar{i,1}=sub_n;
            fubar{i,2}=T1{i,2}{1};
            if concussed(i) == 0
               n_control  = n_control + 1;
               fubar{i,3} = n_control;
            else
               n_concussed = n_concussed + 1;
               fubar{i,4}  = n_concussed;
            end
            
            
         elseif ~isnan(sc(ni))
            sub_n2 = sc_n(ni);
            sub(sub_n2).visit(T1{i,14}).T1_row        = i;
            sub(sub_n2).visit(T1{i,14}).visit         = T1{i,1};
            sub(sub_n2).visit(T1{i,14}).ParticipantID = T1{i,2};
            sub(sub_n2).visit(T1{i,14}).d_oct         = parse_oct2(T1,i);
            
            fubar{i,1}=sub_n2;
            fubar{i,2}=T1{i,2}{1};
            
            
         end
         
      case 'TF'
         n  = tc(3:end);
         ni = str2num(n);
         if isnan(tf(ni))
            tf(ni)   = 1;
            sub_n    = sub_n+1;
            tf_n(ni) = sub_n;
            sub(sub_n).concussed = concussed(i);
            sub(sub_n).sex       = sex(i);
            sub(sub_n).sport     = T1{i,4};
            
            sub(sub_n).visit(T1{i,14}).T1_row        = i;
            sub(sub_n).visit(T1{i,14}).visit         = T1{i,1};
            sub(sub_n).visit(T1{i,14}).ParticipantID = T1{i,2};
            sub(sub_n).visit(T1{i,14}).d_oct         = parse_oct2(T1,i);
            
            fubar{i,1}=sub_n;
            fubar{i,2}=T1{i,2}{1};
            if concussed(i) == 0
               n_control  = n_control + 1;
               fubar{i,3} = n_control;
            else
               n_concussed = n_concussed + 1;
               fubar{i,4}  = n_concussed;
            end
            
         elseif ~isnan(tf(ni))
            sub_n2 = tf_n(ni);
            sub(sub_n2).visit(T1{i,14}).T1_row        = i;
            sub(sub_n2).visit(T1{i,14}).visit         = T1{i,1};
            sub(sub_n2).visit(T1{i,14}).ParticipantID = T1{i,2};
            sub(sub_n2).visit(T1{i,14}).d_oct         = parse_oct2(T1,i);
            
            fubar{i,1}=sub_n;
            fubar{i,2}=T1{i,2}{1};
            
         end
         
      case 'WP'
         n  = tc(3:end);
         ni = str2num(n);
         if isnan(wp(ni))
            wp(ni)   = 1;
            sub_n    = sub_n+1;
            wp_n(ni) = sub_n;
            sub(sub_n).concussed = concussed(i);
            sub(sub_n).sex       = sex(i);
            sub(sub_n).sport     = T1{i,4};
            
            sub(sub_n).visit(T1{i,14}).T1_row        = i;
            sub(sub_n).visit(T1{i,14}).visit         = T1{i,1};
            sub(sub_n).visit(T1{i,14}).ParticipantID = T1{i,2};
            sub(sub_n).visit(T1{i,14}).d_oct         = parse_oct2(T1,i);
            
            fubar{i,1}=sub_n;
            fubar{i,2}=T1{i,2}{1};
            if concussed(i) == 0
               n_control  = n_control + 1;
               fubar{i,3} = n_control;
            else
               n_concussed = n_concussed + 1;
               fubar{i,4}  = n_concussed;
            end
            
         elseif ~isnan(wp(ni))
            sub_n2 = wp_n(ni);
            sub(sub_n2).visit(T1{i,14}).T1_row        = i;
            sub(sub_n2).visit(T1{i,14}).visit         = T1{i,1};
            sub(sub_n2).visit(T1{i,14}).ParticipantID = T1{i,2};
            sub(sub_n2).visit(T1{i,14}).d_oct         = parse_oct2(T1,i);
            
            fubar{i,1}=sub_n;
            fubar{i,2}=T1{i,2}{1};
            
         end
         
      case 'WR'

         n  = tc(4:end);
         ni = str2num(n);
         if isnan(wr(ni))
            wr(ni) = 1;
            sub_n = sub_n+1;
            wr_n(ni) = sub_n;
            sub(sub_n).concussed = concussed(i);
            sub(sub_n).sex       = sex(i);
            sub(sub_n).sport     = T1{i,4};
            
            sub(sub_n).visit(T1{i,14}).T1_row        = i;
            sub(sub_n).visit(T1{i,14}).visit         = T1{i,1};
            sub(sub_n).visit(T1{i,14}).ParticipantID = T1{i,2};
            sub(sub_n).visit(T1{i,14}).d_oct         = parse_oct2(T1,i);
            
            fubar{i,1}=sub_n;
            fubar{i,2}=T1{i,2}{1};
            if concussed(i) == 0
               n_control  = n_control + 1;
               fubar{i,3} = n_control;
            else
               n_concussed = n_concussed + 1;
               fubar{i,4}  = n_concussed;
            end
            
         elseif ~isnan(wr(ni))
            sub_n2 = wr_n(ni);
            sub(sub_n2).visit(T1{i,14}).T1_row        = i;
            sub(sub_n2).visit(T1{i,14}).visit         = T1{i,1};
            sub(sub_n2).visit(T1{i,14}).ParticipantID = T1{i,2};
            sub(sub_n2).visit(T1{i,14}).d_oct         = parse_oct2(T1,i);
            
            fubar{i,1}=sub_n2;
            fubar{i,2}=T1{i,2}{1};
            
         end
         
         
   end % switch
   
   
   
   
   
   
end %for i



% Plot the results
plot_oct_mac_v1
plot_oct_onh_v1




