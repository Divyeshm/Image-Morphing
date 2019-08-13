function [a,b] = sdpoints(  e1x,e1y,e2x,e2y,x0,y0,m)
    alpha=m(1,1);      % alpha 
    beta=m(2,1);       % beta 
    a=x0+(alpha*e1x)+(beta*e2x);     % x coordinate of source or destination image 
    b=y0+(alpha*e1y)+(beta*e2y);       % y coordinate of source or destination image 
    a=round(a);
    b=round(b);
    a=abs(a);
    b=abs(b);
 
end