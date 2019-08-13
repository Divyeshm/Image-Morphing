% to mark triangles on image 
function[ ] = lines()
sp=[218,201,304,196,269,269];
dp=[178,250,280,242,235,314];
img=imread('Bush.jpg');
figure , imshow(img);

hold on;
line([sp(1),sp(3),sp(5)], [sp(2),sp(4),sp(6)], 'Color', 'r');
line([sp(1),sp(5)], [sp(2),sp(6)], 'Color', 'r');
line([sp(1),1], [sp(2),1], 'Color', 'r');
line([500,sp(1),1], [1,sp(2),500], 'Color', 'r');
line([500,sp(3),500], [1,sp(4),500], 'Color', 'r');
line([1,sp(5),500], [500,sp(6),500], 'Color', 'r');
hold off;
img=imread('Clinton.jpg');
figure , imshow(img);
hold on;
line([dp(1),dp(3),dp(5)], [dp(2),dp(4),dp(6)], 'Color', 'r');
line([dp(1),dp(5)], [dp(2),dp(6)], 'Color', 'r');
line([dp(1),1], [dp(2),1], 'Color', 'r');
line([500,dp(1),1], [1,dp(2),500], 'Color', 'r');
line([500,dp(3),500], [1,dp(4),500], 'Color', 'r');
line([1,dp(5),500], [500,dp(6),500], 'Color', 'r');
hold off;

end