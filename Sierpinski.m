function Sierpinski(n)
%Plots n points (excluding initial point) within the visible equilateral triangle boundaries.
%The user should find that for large enough n, the resulting scatter plot
%will resemble Sierpinski's Triangle.
line([0 1],[0 0],'Color','k')
line([0 0.5],[0 0.25*sqrt(3)],'Color','k')
line([0.5 1],[0.25*sqrt(3) 0],'Color','k')
set(gca,'visible','off')
set(gcf,'color','w');
i = 1;
hold on
[x,y]=ginput;
h = plot(x,y,'.k','MarkerSize',10);
while i <= (n)
    corner = round(2*rand(1)+1);
    if corner == 1
        xmean = 0.5*(x+0);
        ymean = 0.5*(y+0);
    elseif corner == 2
        xmean = 0.5*(x+1);
        ymean = 0.5*(y+0);
    else 
        xmean = 0.5*(x+0.5);
        ymean = 0.5*(y+0.25*sqrt(3));
    end
    hold on
    plot(xmean,ymean,'.k','MarkerSize',10)
    x = xmean;
    y = ymean;
    i = i+1;
end
delete(h)
end