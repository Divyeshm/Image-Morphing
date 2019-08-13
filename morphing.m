close all;
clear all;
% read image 
srcimg=imread('Bush.jpg');                       % source image 
destimg=imread('Clinton.jpg');                   % destination image
%function call to show trangulation
lines();
%source image points 
sx0=218;
sy0=201;
sx1=304;
sy1=196;
sx2=269;
sy2=269;
%destination image points 
dx0=178;
dy0=250;
dx1=280;
dy1=242;
dx2=235;
dy2=314;
% display image 
figure,imshow(srcimg);
% create new image with zero pixel values
 temp=zeros(500,500,3);
temp=uint8(temp);
N=20;
for K=0:N
% coordinate interpolation po,p1,p2 values of intermadiate frame
ix0=((N-K)/N)*sx0+(K/N)*dx0;
iy0=((N-K)/N)*sy0+(K/N)*dy0;
ix1=((N-K)/N)*sx1+(K/N)*dx1;        
iy1=((N-K)/N)*sy1+(K/N)*dy1;
ix2=((N-K)/N)*sx2+(K/N)*dx2;
iy2=((N-K)/N)*sy2+(K/N)*dy2;
% loop for every pixel
for x=1:500
    for y=1:500
        if(intriangle1(ix0,iy0,1,1,1,500,x,y)==true)        % intriangle() function = check if point lies in traingle or not.
            e1x=1-ix0;
            e1y=1-iy0;
            e2x=1-ix0;                                      %   e1,e2 vactor values of traingle in frame
            e2y=500-iy0;
            a=alphabeta( e1x,e2x,e1y,e2y,ix0,iy0,x,y);      % alphabeta()  give alpha and beta values for pixel
            [sx,sy]=sdpoints(-217,-200,-217,299,218,201,a);  % sdpoints()  give source and destnation coordinates correspoding to alpha beta 
            [dx,dy]=sdpoints(-177,-249,-177,250,178,250,a);
 red=((N-K)/N)*(srcimg(sx,sy,1))+(K/N)*(destimg(dx,dy,1));    % colour interpolation in all 3 channels
green=((N-K)/N)*(srcimg(sx,sy,2))+(K/N)*(destimg(dx,dy,2));       
blue=((N-K)/N)*(srcimg(sx,sy,3))+(K/N)*(destimg(dx,dy,3));


            temp(x,y,1)=red;
             temp(x,y,2)=green;
             temp(x,y,3)=blue;
           
         elseif(intriangle1(ix0,iy0,ix1,iy1,1,500,x,y)==true)
            e1x=1-ix0;
            e1y=500-iy0;
            e2x=ix1-ix0;
            e2y=iy1-iy0;
      
                a=alphabeta( e1x,e2x,e1y,e2y,ix0,iy0,x,y);
                   [sx,sy]=sdpoints(-217,299,86,-5,218,201,a);
        [dx,dy]=sdpoints(-177,250,102,-8,178,250,a);
         red=((N-K)/N)*(srcimg(sx,sy,1))+(K/N)*(destimg(dx,dy,1));
green=((N-K)/N)*(srcimg(sx,sy,2))+(K/N)*(destimg(dx,dy,2));
blue=((N-K)/N)*(srcimg(sx,sy,3))+(K/N)*(destimg(dx,dy,3));

           temp(x,y,1)=red;
             temp(x,y,2)=green;
            temp(x,y,3)=blue;
        elseif(intriangle1(1,500,ix1,iy1,500,500,x,y)==true)
            e1x=1-ix1;
            e1y=500-iy1;
            e2x=500-ix1;
            e2y=500-iy1;
        
                  a=alphabeta( e1x,e2x,e1y,e2y,ix1,iy1,x,y);
                     [sx,sy]=sdpoints(-303,304,196,304,304,196,a);
           [dx,dy]=sdpoints(-279,258,220,258,280,242,a);
   
           as=srcimg(sx,sy,1);
           zs=destimg(dx,dy,1);
           red=((N-K)/N)*(as)+(K/N)*(zs);
green=((N-K)/N)*(srcimg(sx,sy,2))+(K/N)*(destimg(dx,dy,2));
blue=((N-K)/N)*(srcimg(sx,sy,3))+(K/N)*(destimg(dx,dy,3));
        
          temp(x,y,1)=red;
             temp(x,y,2)=green;
             temp(x,y,3)=blue;
        elseif(intriangle1(ix2,iy2,ix1,iy1,500,500,x,y)==true)
            e1x=ix2-ix1;
            e1y=iy2-iy1;
            e2x=500-ix1;
            e2y=500-iy1;
    
        
              a=alphabeta( e1x,e2x,e1y,e2y,ix1,iy1,x,y);
                 [sx,sy]=sdpoints(-35,73,196,304,304,196,a);
            [dx,dy]=sdpoints(-45,72,220,258,280,242,a);
             red=((N-K)/N)*(srcimg(sx,sy,1))+(K/N)*(destimg(dx,dy,1));
green=((N-K)/N)*(srcimg(sx,sy,2))+(K/N)*(destimg(dx,dy,2));
blue=((N-K)/N)*(srcimg(sx,sy,3))+(K/N)*(destimg(dx,dy,3));
         
           temp(x,y,1)=red;
             temp(x,y,2)=green;
             temp(x,y,3)=blue;
        elseif(intriangle1(ix2,iy2,500,1,500,500,x,y)==true)
            e1x=500-ix2;
            e1y=1-iy2;
            e2x=500-ix2;
            e2y=500-iy2;
        
                a=alphabeta( e1x,e2x,e1y,e2y,ix2,iy2,x,y);
                   [sx,sy]=sdpoints(231,-268,231,231,269,269,a);
            [dx,dy]=sdpoints(265,-313,265,186,235,314,a);
             red=((N-K)/N)*(srcimg(sx,sy,1))+(K/N)*(destimg(dx,dy,1));
green=((N-K)/N)*(srcimg(sx,sy,2))+(K/N)*(destimg(dx,dy,2));
blue=((N-K)/N)*(srcimg(sx,sy,3))+(K/N)*(destimg(dx,dy,3));
           
           temp(x,y,1)=red;
            temp(x,y,2)=green;
              temp(x,y,3)=blue;
        elseif(intriangle1(ix0,iy0,ix2,iy2,500,1,x,y)==true)
            e1x=ix0-ix2;
            e1y=iy0-iy2;
            e2x=500-ix2;
            e2y=1-iy2;
      
                a=alphabeta( e1x,e2x,e1y,e2y,ix2,iy2,x,y);
                   [sx,sy]=sdpoints(-51,-68,231,-268,269,269,a);
            [dx,dy]=sdpoints(-57,-64,265,-313,235,314,a);
             red=((N-K)/N)*(srcimg(sx,sy,1))+(K/N)*(destimg(dx,dy,1));
green=((N-K)/N)*(srcimg(sx,sy,2))+(K/N)*(destimg(dx,dy,2));
blue=((N-K)/N)*(srcimg(sx,sy,3))+(K/N)*(destimg(dx,dy,3));
            
           temp(x,y,1)=red;
             temp(x,y,2)=green;
              temp(x,y,3)=blue;
        elseif(intriangle1(ix0,iy0,1,1,500,1,x,y)==true)
            e1x=1-ix0;
            e1y=1-iy0;
            e2x=500-ix0;
            e2y=1-iy0;
     
               a=alphabeta( e1x,e2x,e1y,e2y,ix0,iy0,x,y);
                  [sx,sy]=sdpoints(-217,-200,282,-200,218,201,a);
            [dx,dy]=sdpoints(-177,-249,322,-249,178,250,a);
             red=((N-K)/N)*(srcimg(sx,sy,1))+(K/N)*(destimg(dx,dy,1));
green=((N-K)/N)*(srcimg(sx,sy,2))+(K/N)*(destimg(dx,dy,2));
blue=((N-K)/N)*(srcimg(sx,sy,3))+(K/N)*(destimg(dx,dy,3));
   
           temp(x,y,1)=red;
           temp(x,y,2)=green;
             temp(x,y,3)=blue;
        elseif(intriangle1(ix0,iy0,ix1,iy1,ix2,iy2,x,y)==true)
            e1x=ix0-ix1;
            e1y=iy0-iy1;
            e2x=ix2-ix1;
            e2y=iy2-iy1;
       
                a=alphabeta( e1x,e2x,e1y,e2y,ix1,iy1,x,y);
                   [sx,sy]=sdpoints(-86,5,-35,73,304,196,a);
            [dx,dy]=sdpoints(-102,8,-45,72,280,242,a);
             red=((N-K)/N)*(srcimg(sx,sy,1))+(K/N)*(destimg(dx,dy,1));
green=((N-K)/N)*(srcimg(sx,sy,2))+(K/N)*(destimg(dx,dy,2));
blue=((N-K)/N)*(srcimg(sx,sy,3))+(K/N)*(destimg(dx,dy,3));
 
            temp(x,y,1)=red;
           temp(x,y,2)=green;
            temp(x,y,3)=blue;
        end
   

    end
end
% display final image 
  figure,imshow(temp);
   imwrite(temp,sprintf('morphing%d.jpg',K))
end
