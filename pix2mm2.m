function [y] = pix2mm2(x)
% This function is based on the document/notes written by Nicholas Port and
% Katie Edwards 4/9/2024.  The pages file is alled 'Calibration Notes
% Documentation' and is on Nick's computer.
% Here are the complete notes:
% 
% Notes on calibration of the SR Research Eye Tracker
% Katie Edwards and Nicholas Port
% 
% 4/9/2024
% 
% We followed the direction at: 
% https://www.sr-research.com/support/thread-154.html
% 
% We used a 2, 4, and 6 mm black circle taped at the plane of the eye/pupil in the eye tracker
% We followed the directions to switch the eye tracker to Pupil Only Mode
% 
% Here are the mean pupil values in the arbitrary units for 20 seconds of data
% 
% 2 mm centroid: 494     = 0.0900
% 2 mm elipse: 498       = 0.0896
% 4 mm centroid: 1379    = 0.1077
% 4 mm elipse: 1394      = 0.1079
% 6 mm centroid: 2743    = 0.1146
% 6 mm elipse: 2751      = 0.1144
% 
% The formula for converting to mm is:
% 
% = pupil(mm)/sqrt( average (AU) )
% 
% So the scale factor is
% x= [0.09 0.0896 0.1077 0.1079 0.1146 0.1144]
% mean = 0.1040
% 
% 
% or
% x= [0.1077 0.1079 0.1146 0.1144]
% mean = 0.1111
% 
% 
% According to the instruction: to finish the conversation
% 
% X mm = sqrt(X pixels) * 0.1111

DEBUG = 0;

if DEBUG
   x1 = [ 2 2 4 4 6 6];
   y1 = [494 498 1379 1394 2743 2751]

   K = mean(x1./sqrt(y1))

   % k = 0.1040 or 0.1039 seems about right

   figure
   hold on
   set(gca,'xlim',[0 8] )
   set(gca,'ylim',[0 3200])
   plot(x1,y1,'bo')

   keyboard
end



y = sqrt(x)*0.1039;



end %function