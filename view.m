% TODO: Complete the following function.
% NOTE: Complete the function drawBall() first and return here later.
% This function returns nothing. It just renders every ball on the canvas.
% ===== arguments =====
% n: number of balls
% positionArray: a matrix. Each row is the position of one ball
% radiusArray: a column vector. Each element is the radius of one ball
% colorArray: a matrix. Each row represents the color of one ball
function view(n, positionArray, radiusArray, colorArray)

  clf; % clear the canvas
  hold on
  axis equal % set the ratio of the two axes to 1:1
  axis([-10,10,-10,10]) % set the size of the canvas

  % Here, you should call drawBall() for each ball to render it.
  % If you just do this, there will only be one ball rendered on the canvas.
  % Think about: how to show all balls on the canvas simultaneously?
  %%% START CODE HERE %%% (≈ 4 line of code)
    for i = 1:n
        drawBall(positionArray(i,:),radiusArray(i,:),colorArray(i,:));
    end
    hold off
  %%% END CODE HERE %%%

end


% TODO: Complete the following function.
% This function returns nothing. It just renders one given ball on the canvas.
% ===== arguments =====
% position: the position of one ball
% radius: the radius of the ball
% color: a row vector that represents the color of the ball
function drawBall(position, radius, ballColor)

  % Use fill() to render the ball.
  %%% START CODE HERE %%% (≈ 4 line of code)
    t = 0:0.1:2*pi;
    x = cos(t)*radius+position(1);
    y = sin(t)*radius+position(2);
    fill(x,y,ballColor)
  %%% END CODE HERE %%%

end
