function [d_oct] = parse_oct(T1,i)
%  Parse_oct for the data structure
%   Parse columnms 62-135

% START HERE FOR PARSING COLUMNS



%keyboard

%Let's figure this out
% the first section is about the Optic Nerve Head and the 2nd section is
% the Macule

%%%%%%%%%%%%%%%%%%%%%%
% Optic Nerve Head   %

% 62 Avg Thickness - OD


% 63 = SupNas   - OD
% 64 = SupTemp  - OD
% 65 = InfNas   - OD
% 66 = InfTemp  - OD

% 67 = Temp - OD
% 68 = Nas  - OD

% 69 = Avg Thick  - OS

% 70 = SupNas    - OS
% 71 = SupTemp   - OS
% 72 = InfNas    - OS
% 73 = InfTemp   - OS

% 74 = Temp - OS
% 75 = Nas  - OS


% I'm going to start small and just work on the 6 section optic nerve head

d_oct(1).onh(1) = mean([T1{i,68} T1{i,75}]); % 68 = Nas      - OD  % 75 = Nas      - OS
d_oct(1).onh(2) = mean([T1{i,63} T1{i,70}]); % 63 = SupNas   - OD  % 70 = SupNas   - OS
d_oct(1).onh(3) = mean([T1{i,64} T1{i,71}]); % 64 = SupTemp  - OD  % 71 = SupTemp  - OS
d_oct(1).onh(4) = mean([T1{i,67} T1{i,74}]); % 67 = Temp     - OD  % 74 = Temp     - OS
d_oct(1).onh(5) = mean([T1{i,66} T1{i,73}]); % 66 = InfTemp  - OD  % 73 = InfTemp  - OS
d_oct(1).onh(6) = mean([T1{i,65} T1{i,74}]); % 65 = InfNas   - OD  % 72 = InfNas   - OS
d_oct(1).onh(7) = mean([T1{i,62} T1{i,69}]); % 62 = AvgThick - OD  % 69 = AvgThick - OS



%%%%%%%%%%%
% Macula  %

% 76 = Avg Thick     - OD
% 77 = Avg Thick Sup - OD
% 78 = Avg Thick Inf - OD

% NFL
% 79 = 1 CST         - OD
% 80 = 2 Inner Nas   - OD
% 81 = 3 Inner Sup   - OD
% 82 = 4 Inner Temp  - OD
% 83 = 5 Inner Inf   - OD
% 84 = 6 Out Nas     - OD
% 85 = 7 Out Sup     - OD
% 86 = 8 Out Temp    - OD
% 87 = 9 Out Inf     - OD

% NFL
% 109 - 1 CST          - OS
% 110 - 2 Inner Nas    - OS
% 111 - 3 Inner Sup    - OS
% 112 - 4 Inner Temp   - OS
% 113 - 5 Inner Inf    - OS
% 114 - 6 Outer Nas    - OS
% 115 - 7 Outer Sup    - OS
% 116 - 8 Outer Temp   - OS
% 117 - 9 Outer Inf    - OS

% NFL
d_oct(1).mac(1) = mean([T1{i,79} T1{i,109}]); % 79 = 1 CST         - OD % 109 - 1 CST          - OS
d_oct(1).mac(2) = mean([T1{i,80} T1{i,110}]); % 80 = 2 Inner Nas   - OD % 110 - 2 Inner Nas    - OS
d_oct(1).mac(3) = mean([T1{i,81} T1{i,111}]); % 81 = 3 Inner Sup   - OD % 111 - 3 Inner Sup    - OS
d_oct(1).mac(4) = mean([T1{i,82} T1{i,112}]); % 82 = 4 Inner Temp  - OD % 112 - 4 Inner Temp   - OS
d_oct(1).mac(5) = mean([T1{i,83} T1{i,113}]); % 83 = 5 Inner Inf   - OD % 113 - 5 Inner Inf    - OS
d_oct(1).mac(6) = mean([T1{i,84} T1{i,114}]); % 84 = 6 Out Nas     - OD % 114 - 6 Outer Nas    - OS
d_oct(1).mac(7) = mean([T1{i,85} T1{i,115}]); % 85 = 7 Out Sup     - OD % 115 - 7 Outer Sup    - OS
d_oct(1).mac(8) = mean([T1{i,86} T1{i,116}]); % 86 = 8 Out Temp    - OD % 116 - 8 Outer Temp   - OS
d_oct(1).mac(9) = mean([T1{i,87} T1{i,117}]); % 87 = 9 Out Inf     - OD % 117 - 9 Outer Inf    - OS


% Total Thickness
% 88 = 1 CST         - OD
% 89 = 2 Inner Nas   - OD
% 90 = 3 Inner Sup   - OD
% 91 = 4 Inner Temp  - OD
% 92 = 5 Inner Inf   - OD
% 93 = 6 Outer Nas   - OD
% 94 = 7 Outer Sup   - OD
% 95 = 8 Outer Temp  - OD
% 96 = 9 Outer Inf   - OD

% Total Thickness
% 118 - 1 CST          - OS
% 119 - 2 Inner Nas    - OS
% 120 - 3 Inner Sup    - OS
% 121 - 4 Inner Temp   - OS
% 122 - 5 Inner Inf    - OS
% 123 - 6 Outer Nas    - OS
% 124 - 7 Outer Sup    - OS
% 125 - 8 Outer Temp   - OS
% 126 - 9 Outer Inf    - OS

% Total Thickness
d_oct(2).mac(1) = mean([ T1{i,88} T1{i,118} ]); % 88 = 1 CST         - OD % 118 - 1 CST          - OS
d_oct(2).mac(2) = mean([ T1{i,89} T1{i,119} ]); % 89 = 2 Inner Nas   - OD % 119 - 2 Inner Nas    - O
d_oct(2).mac(3) = mean([ T1{i,90} T1{i,120} ]); % 90 = 3 Inner Sup   - OD % 120 - 3 Inner Sup    - OS
d_oct(2).mac(4) = mean([ T1{i,91} T1{i,121} ]); % 91 = 4 Inner Temp  - OD % 121 - 4 Inner Temp   - OS
d_oct(2).mac(5) = mean([ T1{i,92} T1{i,122} ]); % 92 = 5 Inner Inf   - OD % 122 - 5 Inner Inf    - OS
d_oct(2).mac(6) = mean([ T1{i,93} T1{i,123} ]); % 93 = 6 Outer Nas   - OD % 123 - 6 Outer Nas    - OS
d_oct(2).mac(7) = mean([ T1{i,94} T1{i,124} ]); % 94 = 7 Outer Sup   - OD % 124 - 7 Outer Sup    - OS
d_oct(2).mac(8) = mean([ T1{i,95} T1{i,125} ]); % 95 = 8 Outer Temp  - OD % 125 - 8 Outer Temp   - OS
d_oct(2).mac(9) = mean([ T1{i,96} T1{i,126} ]); % 96 = 9 Outer Inf   - OD % 126 - 9 Outer Inf    - OS


% GCA
% 97  = 1 CST         - OD
% 98  = 2 Inner Nas   - OD
% 99  = 3 Inner Sup   - OD
% 100 = 4 Inner Temp  - OD
% 101 = 5 Inner Inf   - OD
% 102 = 6 Outer Nas   - OD
% 103 = 7 Outer Sup   - OD
% 104 = 8 Outer Temp  - OD
% 105 = 9 Outer Inf   - OD

% GCA
% 127 - 1 CST         - OS
% 128 - 2 Inner Nas   - OS
% 129 - 3 Inner Sup   - OS
% 130 - 4 Inner Temp  - OS 
% 131 - 5 Inner Inf   - OS
% 132 - 6 Outer Nas   - OS
% 133 - 7 Outer Sup   - OS
% 134 - 8 Outer Temp  - OS
% 135 - 9 Outer inf   - OS


d_oct(3).mac(1) = mean([ T1{i,97}  T1{i,127} ]); % 97  = 1 CST         - OD % 127 - 1 CST         - OS
d_oct(3).mac(2) = mean([ T1{i,98}  T1{i,128} ]); % 98  = 2 Inner Nas   - OD % 128 - 2 Inner Nas   - OS
d_oct(3).mac(3) = mean([ T1{i,99}  T1{i,129} ]); % 99  = 3 Inner Sup   - OD % 129 - 3 Inner Sup   - OS
d_oct(3).mac(4) = mean([ T1{i,100} T1{i,130} ]); % 100 = 4 Inner Temp  - OD % 130 - 4 Inner Temp  - OS 
d_oct(3).mac(5) = mean([ T1{i,101} T1{i,131} ]); % 101 = 5 Inner Inf   - OD % 131 - 5 Inner Inf   - OS
d_oct(3).mac(6) = mean([ T1{i,102} T1{i,132} ]); % 102 = 6 Outer Nas   - OD % 132 - 6 Outer Nas   - OS
d_oct(3).mac(7) = mean([ T1{i,103} T1{i,133} ]); % 103 = 7 Outer Sup   - OD % 133 - 7 Outer Sup   - OS
d_oct(3).mac(8) = mean([ T1{i,104} T1{i,134} ]); % 104 = 8 Outer Temp  - OD % 134 - 8 Outer Temp  - OS
d_oct(3).mac(9) = mean([ T1{i,105} T1{i,135} ]); % 105 = 9 Outer Inf   - OD % 135 - 9 Outer inf   - OS



% Macula   - OS

% 106 = Avg Thick      - OS
% 107 = Avg Thick Sup  - OS
% 108 = Avg Thick Inf  - OS

% NFL
% 109 - 1 CST          - OS
% 110 - 2 Inner Nas    - OS
% 111 - 3 Inner Sup    - OS
% 112 - 4 Inner Temp   - OS
% 113 - 5 Inner Inf    - OS
% 114 - 6 Outer Nas    - OS
% 115 - 7 Outer Sup    - OS
% 116 - 8 Outer Temp   - OS
% 117 - 9 Outer Inf    - OS

% Total Thickness
% 118 - 1 CST          - OS
% 119 - 2 Inner Nas    - OS
% 120 - 3 Inner Sup    - OS
% 121 - 4 Inner Temp   - OS
% 122 - 5 Inner Inf    - OS
% 123 - 6 Outer Nas    - OS
% 124 - 7 Outer Sup    - OS
% 125 - 8 Outer Temp   - OS
% 126 - 9 Outer Inf    - OS

% GCA
% 127 - 1 CST         - OS
% 128 - 2 Inner Nas   - OS
% 129 - 3 Inner Sup   - OS
% 130 - 4 Inner Temp  - OS 
% 131 - 5 Inner Inf   - OS
% 132 - 6 Outer Nas   - OS
% 133 - 7 Outer Sup   - OS
% 134 - 8 Outer Temp  - OS
% 135 - 9 Outer inf   - OS


d_oct(1).t1=T1(i,:);






end












































%