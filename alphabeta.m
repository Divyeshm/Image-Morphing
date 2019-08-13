function [ a] = alphabeta( e1x,e2x,e1y,e2y,x0,y0,x,y )
  C=[x-x0;y-y0];                % p-po
  B=[e1x,e2x;e1y,e2y];
 B=inv(B);                 % inverse of B matrix e1,e2 vector matrix
a=B*C;                     % multiplication of B and c matrix 
end