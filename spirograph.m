function spirograph()
%Generates spirograph designs via user input.
cond = 'y';
fileID = fopen('spiro_file.txt','w');
fprintf(fileID, 'Spirograph Instructions\n\n');

while strcmp(cond,'y')
R = input('Enter radius of gear: ');
r = input('Enter radius, r, of inside wheel: ');
rho = input('Enter displacement from center of wheel (between -r and r): ');
shift = input('Enter CCW rotation in radians: ');
shift = -1*shift;
color = input('Color: ');
fprintf(fileID, 'R=%f,r=%f,rho=%f,shift=%f\n\n',[R,r,rho,-1*shift]);

figure(1)
hold on
t = linspace(0,(lcm(r,R)/r)*2*pi,10000);
x = (R-r)*cos(t-shift)+rho*cos((R/r-1)*(t));
y = (R-r)*sin(t-shift)-rho*sin((R/r-1)*(t));
plot(x,y,color)
axis equal
%{
figure(2)
hold on
x = R*cos(t); y = R*sin(t);
plot(x,y,color)
x = (R-r)*cos(-shift)+r*cos(t); y = (R-r)*sin(-shift)+r*sin(t);
hold on
plot(x,y,color)
hold on
plot((R-r+rho)*cos(-shift),(R-r+rho)*sin(-shift),strcat('.',color),'Markersize',20)
grid
axis equal
%}
cond = input('Add design (y/n)? ');

end
fclose(fileID);
cond = input('Save a pdf of design (y/n)? ');
if strcmp(cond,'y')
    axis off
    print('my_design','-depsc')  %Create eps file.
    eps2pdf('my_design.eps'); %User needs this file in their current folder.
end
close all
clear
clc
end
