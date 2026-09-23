function [x2,y2,pa2] = trim_via_eye_movements1(t,x,y,pa)
% Trim the eye movement and pupil signal because of eyemovement sign loss
%   Detailed explanation goes here

DEBUG1 = 0;

x2 = x;
y2 = y;
pa2 = pa;

% Find the start and stops of NANs
% x
j = 0; k = 0;
sxa = []; sxb = [];
for i = 1:length(x)-1
   if ~isnan(x(i)) & isnan(x(i+1))
      j = j + 1;
      sxa(j)=i;
   end
   if isnan(x(i)) & ~isnan(x(i+1))
      k = k + 1;
      sxb(k)=i;
   end
end %j

% y
j = 0; k = 0;
sya = []; syb = [];
for i = 1:length(y)-1
   if ~isnan(y(i)) & isnan(y(i+1))
      j = j + 1;
      sya(j)=i;
   end
   if isnan(y(i)) & ~isnan(y(i+1))
      k = k + 1;
      syb(k)=i;
   end
end %j




% Now trim data before and after
KP = 0.060;  %How much additional pupil to delete because the eye tracker is not quite stable before and after blinks


% X trace
for i = 1:length(sxa)
   t_t = t(sxa(i)); % Find out the current time for this NAN
   t_i  = find(t < (t_t-KP)); % Find the time point we wish to cut back too
   if isempty(t_i) 
      t_i = 1;
   end
   t_i  = t_i(end);           
   x2(  t_i:sxa(i) ) = NaN;
   pa2( t_i:sxa(i) ) = NaN;
end

for i = 1:length(sxb)
   t_t = t(sxb(i)); % Find out the current time for this NAN
   t_i  = find(t > (t_t+KP)); % Find the time point we wish to cut forward too
   if isempty(t_i)              % the t_t+X mark is beyond the end of the array
      t_i = length(t);
   end
   t_i  = t_i(1);
   x2(  sxb(i):t_i ) = NaN;
   pa2( sxb(i):t_i ) = NaN;
end

% Y trace
for i = 1:length(sya)
   t_t = t(sya(i)); % Find out the current time for this NAN
   t_i  = find(t < (t_t-KP)); % Find the time point we wish to cut back too
   if isempty(t_i) 
      t_i = 1;
   end
   t_i  = t_i(end);           
   y2(  t_i:sya(i) ) = NaN;
   pa2( t_i:sya(i) ) = NaN;
end

for i = 1:length(syb)
   t_t = t(syb(i)); % Find out the current time for this NAN
   t_i  = find(t > (t_t+KP)); % Find the time point we wish to cut forward too
   if isempty(t_i)              % the t_t+X mark is beyond the end of the array
      t_i = length(t);
   end
   t_i  = t_i(1);
   y2(  syb(i):t_i ) = NaN;
   pa2( syb(i):t_i ) = NaN;
end





if DEBUG1
   figure
   hold on
   plot(t,x, 'k-')
   plot(t,x2,'b-','LineWidth',2)
   set(gca,'xlim',[t(1) t(end)]);

   figure
   hold on
   plot(t,y, 'k-')
   plot(t,y2,'r-','LineWidth',2)
   set(gca,'xlim',[t(1) t(end)]);

   figure
   hold on
   plot(t,pa, 'k-')
   plot(t,pa2,'m-','LineWidth',2)
   set(gca,'xlim',[t(1) t(end)]);


   keyboard

end

end