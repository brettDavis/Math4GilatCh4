% Chapter 4 Using Script Files and Managing Data
%
%  <Problems # 1,3,4,7,9,11,12>
%
%  <Brett Davis>
%  <20140227>
%

%% Problem 1
clear all
close all
% Determine the r_1 r_2 and the surface area of a paper cup
% various heights will be given.
% The volume is supposed to be 250 cm^3

%vars

r_1 = [2.9909];

r_2 = 1.25 .* r_1;

h = [5:10];

%formulas

V = ((pi * h)/3)*(r_1.^2 + r_2.^2 + r_1*r_2);

S = pi * (r_1+r_2) * sqrt((r_2-r_1).^2 + h.^2) + (pi*r_1.^2);

%disp


table = [V' S'];


disp(' ')
disp('        Volume     Surface Area')
disp('        (cm^3)       (cm^2)')
disp(' ')
disp(table)
format short
fprintf('When the Volume is %5.2f cm^3\nThe Surface Area is %5.2f cm^2\n' , V(1,3), S(1,3))


%export

fid1 = fopen('4_1_output','w');
fprintf(fid1,'Volume   Surface Area\n');
fprintf(fid1,'(cm^3)           (cm^2)\n');
fprintf(fid1,'\n');
fprintf(fid1,'%5.2f      %5.2f \n', table(1,1:2));
fprintf(fid1,'%5.2f      %5.2f \n', table(2,1:2));
fprintf(fid1,'%5.2f      %5.2f \n', table(3,1:2));
fprintf(fid1,'%5.2f      %5.2f \n', table(4,1:2));
fprintf(fid1,'%5.2f      %5.2f \n', table(5,1:2));
fprintf(fid1,'%5.2f      %5.2f \n', table(6,1:2));
fprintf(fid1,'\n');
fprintf(fid1,'When the Volume is %5.2f cm^3\nThe Surface Area is %5.2f cm^2\n' , V(1,3), S(1,3));

%% Problem 3
clear all
close all
%Calculate the quickest route a lifeguard can take when standing on
%the shore. Its speed on the sand is 3 m/s and in the water it clocks
%in at 1 m/s.

%main

y = [48:-1:20];

distanceSand = sqrt(30^2 + y.^2);
timeSand     = distanceSand/3;

distanceWater= sqrt(42^2 + (48-y).^2);
timeWater    = distanceWater;

timeTotal    = timeSand + timeWater;
distanceTotal= distanceSand + distanceWater;

timeFastest  = min(timeTotal);

velocityAverage = distanceTotal ./ timeTotal;

%Snell's Law

velocitySand = distanceSand ./ timeSand;
velocityWater= distanceWater./ timeWater;

phi          = atand(y./30);
alpha        = abs(90-atand(42./(48-y)));

snellsRatio  = sind(phi)./sind(alpha);
theTest      = velocitySand ./ velocityWater;

snellsTable  = [snellsRatio' theTest'];

%disp

table = [y' timeTotal' distanceTotal' velocityAverage' snellsTable];

disp(' ');
disp('   y Value     Time    Distance   Avg. Vel  Snells  Vrun/Vswim'    );
disp('     (m)       (s)       (m)       (m\s)   Ratio      (m/s)'    );
disp(' ')
disp(table);
disp(' ')
fprintf('The fastest time was:      %5.2f seconds\n',timeFastest);
fprintf('The Average Velocity was:  %5.2f m/s\n',table(12,4));
fprintf('Snells ratio computed to:  %5.2f\n',table(12,5));
fprintf('Vrun/Vswim was:            %5.2f\n',table(12,6));

%plot

plot(y,timeTotal,37,timeFastest,'r*')
xlabel('y Value')
ylabel('Total Time (seconds)')
title('\fontname{Arial}Y Values and their Times','FontSize',15)

%% Problem 4
clear all
close all
%Calculate the relative amount of Technitium-99 in a patients body
%after 24 hours. Technitium-99 has a half life of six hours

%radioactive decay model: A = A_0e^kt

%vars

t =[0:2:24];

k = -.115525;

%formula

a_0 = 1 .* exp(k .* 0);

a_n = a_0 .* exp(k .* t);

%disp

table = [t' a_n'];

disp(' ')
disp('Relative amount of Tech-99 by the hour')
disp(' ')
disp('   (Hours)   (Amount Left)')
disp(' ')
disp(table)

%%plot

plot(t,a_n,'g')
xlabel('Time (hours)')
ylabel('Amount of Technitium 99 (relative)')
title('\fontname{Arial}Problem 4; Modeling Radioactive Decay','FontSize',15)
%% Problem 5
clear all
close all
format bank
%Write a script file that determines the balance in a savings account
%at the end of every year for the first 10 years. 

%vars_given

A = 1000;
r = 6.5;

%formula

n = [0:10];

B = A * (1 + (r/100)).^n;

%disp

table = [B'];

disp(' ')
disp('Balance Over Ten Years')
disp('        (USD)   ')
disp(' ')
disp(table)


%% Problem 7
clear all
close all
%A variation in benzine in units of (mm Hg) of benzene with temperature
%in the range of 0<=T<=42 deg_C can be modeled with a given equation. 
%Create a program that creates a vector of temperatures from 0 to 42 
% in the increment of 2 degrees, and displays a two columns table of
%p and T where the first column are temperatures in deg_C and the second
%is the corresponding pressures in mm_Hg

T = [0:2:42];

a = 34172;
b = 7.9622;

%formula

p = 10.^(b - ((0.05223 * a)./(T + 273.15)));

%disp

table = [T',p'];

disp(' ')
disp('Variation of Vapor Pressure as Observed in a Benzine Solution')
disp(' ')
disp('          Deg_C        mm_Hg')
disp(' ')
disp(table)

%plot

plot(T,p,'r')
xlabel('Temperature (C)')
ylabel('Vapor Pressure (mm Hg)')
title('\fontname{Arial}Problem 7; Vapor Pressure of Benzine','FontSize',15)
%% Problem 9
clear all
close all


%% Problem 11
clear all
close all 
% A truss structure is made of members jointed at their ends. For the 
% truss shown in the figure, the forces in the 9 members are determined
% by solving the following system of equations.

a = [cosd(45) 1 0 0 0 0 0 0 0 0];

b = [-cosd(45) 0 0 1 cosd(48.81) 0 0 0 0 0];

c = [-sind(45) 0 -1 0 -sind(48.81) 0 0 0 0 1000];

d = [0 0 0 -1 0 0 0 cosd(48.81) 0 0];

e = [0 0 0 0 0 0 -1 -sind(48.81) 0 500];

f = [0 0 0 0 -cosd(48.81) -1 0 0 1 0];

g = [0 0 0 0 sind(48.81) 0 1 0 0 4000];

h = [0 0 0 0 0 0 0 sind(48.81) 0 -1107.14];

i = [0 0 0 0 0 0 0 -cosd(48.81) -1 0];

table = [a;b;c;d;e;f;g;h;i];

solved = rref(table);

%disp

fprintf('\n')
fprintf('The evaluation of the stresses on a system of trusses \n \n')
fprintf('Truss 1:  %5.3f N \n',solved(1,10))
fprintf('Truss 2:  %5.3f N \n',solved(2,10))
fprintf('Truss 3:  %5.3f N \n',solved(3,10))
fprintf('Truss 4:  %5.3f N \n',solved(4,10))
fprintf('Truss 5:  %5.3f N \n',solved(5,10))
fprintf('Truss 6:  %5.3f N \n',solved(6,10))
fprintf('Truss 7:  %5.3f N \n',solved(7,10))
fprintf('Truss 8:  %5.3f N \n',solved(8,10))
fprintf('Truss 9:  %5.3f N \n',solved(9,10))
fprintf('\n')

