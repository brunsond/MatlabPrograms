function billiard_table(xdim,ydim,N)
%Plot billiard table
figure()
plot([0 xdim],[0 0],[0 xdim],[ydim ydim],[0 0],[0 ydim],[xdim xdim],[0 ydim],'k','linewidth',2)
axis equal
x = 0;  y = 0;
bounce = 0;
hold on
xdelta = 1; ydelta = 1;
while (bounce <= N)   
x = x + xdelta;  y = y + ydelta;
plot([x-xdelta,x],[y-ydelta,y],'linewidth',2)
if (x>=xdim || x<=0)
   xdelta = -1*xdelta;
   bounce = bounce + 1;
end
if (y>=ydim || y<=0)
   ydelta = -1*ydelta;
   bounce = bounce + 1;
end
end
plot(0,0,'.r','Markersize',20)  %starting point
plot(x,y,'.r','Markersize',20)  %ending point
end
