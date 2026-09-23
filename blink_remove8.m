function [blink_count, xx2, yy2, pa1, pa2 ] = blink_remove8(x,y,x2,y2,pa1,pa2,t)



% March 6th, 2025
% This is a major rewrite of this function.  It maybe the pupil trace is
% better than X-Y eye movements for removing blinks.  I also need to deal
% with signal loss in just 1 eye.  Going to try just monitoring the puipil
% in each eye.  Trimming alot bit before or after


DEBUG1 = 0;
DEBUG2 = 0;
DEBUG3 = 0;


x_o   = x;
y_o   = y;
pa1_o = pa1;
pa2_o = pa2;

% Lets see what the raw data looks like
if DEBUG1
   dh1 = figure;
   subplot(2,1,1)
   hold on
   plot(t,x,'b-');
   plot(t,y,'r-');
   plot(t,x2,'g-');
   plot(t,y2,'m-');
   set(gca,'xlim',[t(1) t(end)]);
   set(gca,'ylim',[-40 40]);
   title('Eye Position')
   grid on

   %dh2 = figure;
   subplot(2,1,2)
   hold on
   plot(t,pa1,'b-');
   plot(t,pa2,'r-');
   set(gca,'xlim',[t(1) t(end)]);
   set(gca,'ylim',[-10 3000]);
   title('Pupil Size')
   grid on


end


% Set anything below a threshold to NAN
pa1(pa1<200) = NaN;
pa2(pa2<200) = NaN;

% Looks like we need to do the same thing for the eye traces

x(x<-100)   = NaN;
y(y<-100)   = NaN;
x2(x2<-100) = NaN;
y2(y2<-100) = NaN;


% figure
% hold on
% plot(t,x,'b.');
% plot(t,y,'r.');
% set(gca,'xlim',[t(1) t(end)]);

%figure
%hold on
%plot(t,x2,'b-');
%plot(t,y2,'r-');   
%set(gca,'xlim',[t(1) t(end)]);

[x,  y,  pa1] = trim_via_eye_movements1( t, x, y, pa1 );
[x2, y2, pa2] = trim_via_eye_movements1( t, x2,y2,pa2 );

% figure
% hold on
% plot(t,x,'b-','LineWidth',2);
% plot(t,y,'r-');
% set(gca,'xlim',[t(1) t(end)]);



%
if DEBUG2
   figure
   hold on
   plot(t,pa1,'b-','LineWidth',2);
   plot(t,pa2,'r-','LineWidth',2);
   set(gca,'ylim',[-10 3000]);
   set(gca,'xlim',[t(1) t(end)]);
   title('Pupil Size')
   keyboard
end

% Find the start and stops of NANs
% Pupil 1
j = 0;
k = 0;
s1a = [];
s1b = [];
for i = 1:length(pa1)-1
   if ~isnan(pa1(i)) & isnan(pa1(i+1))
      j = j + 1;
      s1a(j)=i;
   end
   if isnan(pa1(i)) & ~isnan(pa1(i+1))
      k = k + 1;
      s1b(k)=i;
   end
end %j


% Pupil 2
j = 0;
k = 0;
s2a = [];
s2b = [];
for i = 1:length(pa2)-1
   if ~isnan(pa2(i)) & isnan(pa2(i+1))
      j = j + 1;
      s2a(j)=i;
   end
   if isnan(pa2(i)) & ~isnan(pa2(i+1))
      k = k + 1;
      s2b(k)=i;
   end
end %j



if DEBUG2                            % Check the beginning and end of NANs
   % Pupil 1
   for j = 1:length(s1a)
      plot(t(s1a(j)),pa1(s1a(j)),'go','LineWidth',2)
   end
   for j = 1:length(s1b)
      plot(t(s1b(j)+1),pa1(s1b(j)+1),'ro','LineWidth',2)
   end


   % Pupil 2
   for j = 1:length(s2a)
      plot(t(s2a(j)),pa2(s2a(j)),'go','LineWidth',2)
   end
   for j = 1:length(s2b)
      plot(t(s2b(j)+1),pa2(s2b(j)+1),'ro','LineWidth',2)
   end
end %if DEBUG3


%
% Now delete some data from the start and stops because the signal is not
% stable for a certain number of millisecons
%

KP = 0.080;  %How much additional pupil to delete because the eye tracker is not quite stable before and after blinks

%
% Pupil 1
%
for i = 1:length(s1a)
   t_t = t(s1a(i)); % Find out the current time for this NAN
   t_i  = find(t < (t_t-KP)); % Find the time point we wish to cut back too
   if isempty(t_i) 
      t_i = 1;
   end
   t_i  = t_i(end);           
   pa1( t_i:s1a(i) )=NaN;
end

for i = 1:length(s1b)
   t_t = t(s1b(i)); % Find out the current time for this NAN
   t_i  = find(t > (t_t+KP)); % Find the time point we wish to cut forward too
   if isempty(t_i)              % the t_t+X mark is beyond the end of the array
      t_i = length(t);
   end
   t_i  = t_i(1);
   pa1( s1b(i):t_i )=NaN;
end

%
% Pupil 2
%
for i = 1:length(s2a)
   t_t = t(s2a(i)); % Find out the current time for this NAN
   t_i  = find(t < (t_t-KP)); % Find the time point we wish to cut back too
   if isempty(t_i) 
      t_i = 1;
   end
   t_i  = t_i(end);
   pa2( t_i:s2a(i) )=NaN;
end

for i = 1:length(s2b)
   t_t = t(s2b(i)); % Find out the current time for this NAN
   t_i  = find(t > (t_t+KP)); % Find the time point we wish to cut forward too
   if isempty(t_i)              % the t_t+X mark is beyond the end of the array
      t_i = length(t);
   end
   t_i  = t_i(1);           
   pa2( s2b(i):t_i )=NaN;
end







if DEBUG3                 % Look at the pupil traces after NAN
   figure
   hold on
   plot(t,pa1,'b-','LineWidth',2);
   plot(t,pa2,'r-','LineWidth',2);
   set(gca,'xlim',[t(1) t(end)]);
   set(gca,'ylim',[-10 3000]);
   title('After pre-post is removed.  Pupil Size')
   keyboard
end

 

blink_count = 0;
xx2 = x;
yy2 = y;



% fini

