function [max_constrict, t_max_constrict, max_con_vel, t_max_con_vel, ...
   max_dil_vel,t_max_dil_vel, T75_time, avg_con_vel,avg_dil_vel,min_constrict ] = pupil_dynamics3(t,a)
% This providies the pupil dynmaics for t,a
%   t = time
%   a = pupil aperature


DEBUG = 0;

if DEBUG
   figure
   subplot(2,2,1);
   hold on
   subplot(2,2,2);
   hold on
   subplot(2,2,3);
   hold on
   subplot(2,2,4);
   hold on
end

%t = nanmean(sub(s).ex(e).d(1).t_m);
%y = nanmean(sub(s).ex(e).d(1).pa_m);





s1 = find(t > 0, 1 );
s2 = find(t > 3, 1 );

% Find the min_constriction  12/9/25
min_constrict = max(a(1:s1));


% Now trim the data between stimulus onset and 3s post-stimulus onset
t = t(s1:s2);
a = a(s1:s2);

% Max constriction
[max_constrict, i] = min(a);
t_max_constrict   = t(i);

% Find the 25% mark of constriction
T75_value = max_constrict * 0.25;
% i is the t_max_constrict
ii=find(a(i:end-1)>T75_value,1,'first'); % Was a(i:end)

if isempty(ii)
    T75_time=t(end);
else
   T75_time=t(i+ii);
end

% differentiate
%da  = filter_nan8(gradient(filter_nan8(a)));
da  = filter_nan8(gradient(filter_nan8(a),t));
t1  = t(1:i);
t2  = t(i:end);
da1  = da(1:i);
da2  = da(i:end);

% Average Constsriction Velocity
% This is the mean velocity from stimulus onset (time point 1)
% to time of maxium contstriction (t_max_constrict or i)
avg_con_vel=mean(da1);

% Max constriction Velocity
[max_con_vel, j] = min(da1);
t_max_con_vel = t1(j);

% Max dilation Velocity
[max_dil_vel, k] = max(da2);
t_max_dil_vel = t2(k);

% Average dilation Velocity
% This is the mean velocity from stimulus onset (time point 1)
% to time of maxium contstriction (t_max_constrict or i)
avg_dil_vel=mean(da2);


if DEBUG
   subplot(2,2,1)
   hold on
   grid on
   plot(t,a,'b-');
   plot(t_max_constrict, max_constrict, 'ro');

   subplot(2,2,2);
   grid on
   plot(t,da,'b-');

   subplot(2,2,3);
   grid on
   plot(t1,da1,'b-');
   plot(t_max_con_vel, max_con_vel, 'ro');

   subplot(2,2,4);
   grid on
   plot(t2,da2,'b-');
   plot(t_max_dil_vel, max_dil_vel, 'ro');

  keyboard

end








end

