function [x1,y1, ci1] = m_std2polygon(x_meancontrol ,y_meancontrol, std, h_color)
% This is Lauren First Function where she fulls understands the
% beauty of functions
%   Make a polygon structure for mean and SD error bars

x1 = x_meancontrol;
y1 = y_meancontrol;


% x1 = nanmean(en(1).d(d).t(:,1:K));
% y1 = nanmean(en(1).d(d).pa(:,1:K));


patch([x1 fliplr(x1)], [y1-std fliplr(y1+std)], h_color, 'FaceColor', h_color,'FaceAlpha',0.15, 'EdgeColor',h_color, 'EdgeAlpha', 0.15)

% x2 = x_meanconcuss;
% y2 = y_meanconcuss;
% 
% % x1 = nanmean(en(1).d(d).t(:,1:K));
% % y1 = nanmean(en(1).d(d).pa(:,1:K));
% 
% ci2 = CIFcn((y2),  95);
% 
% patch([x1 fliplr(x1)], [y1-ci2(2) fliplr(y1+ci2(2))], h_color(d,:), 'FaceColor', h_color(d,:),'FaceAlpha',0.3, 'EdgeColor',h_color(d,:), 'EdgeAlpha', 0.3)



end