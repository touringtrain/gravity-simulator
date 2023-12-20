% VG101 (22SU) Lab Demo Project 1
% Gravity simulator

FPS = 100; dt = 1/FPS;
n=input("Number of balls: ");


% Initialize the model.
% Copy and paste your code for milestone 1 here.
positionArray = zeros(n,2);
% initialize positionArray, each row is the position of one ball
%%% START CODE HERE %%% (≈ 1 line of code)
positionArray = rand([n,2])*16-8;
%%% END CODE HERE %%%

radiusArray = zeros(n,1);
% initialize radiusArray, each element is the radius of one ball
%%% START CODE HERE %%% (≈ 1 line of code)
radiusArray = rand([n,1])+0.5;
%%% END CODE HERE %%%

velocityArray = zeros(n,2);
% initialize velocityArray, each row is the velocity of one ball
%%% START CODE HERE %%% (≈ 1 line of code)
velocityArray = rand([n,2])+2-1;
%%% END CODE HERE %%%

accelerationArray = zeros(n,2);
% initialize accelerationArray, each row is the acceleration of one ball
%%% START CODE HERE %%% (≈ 1 line of code)
accelerationArray = rand([n,2])*4-2;
%%% END CODE HERE %%%

% A matrix, each row is the color of one ball
%%% START CODE HERE %%% (≈ 1 line of code)
colorArray = rand([n,3])*0.8+0.2;
%%% END CODE HERE %%%

% TODO: Finish the main loop.
round = 0;
while round<1000

  % Call the controller to update the model, and call view() to render the model.
  % The controller consists of evolve(), boundaryCrash() and mutualCrash().
  %%% START CODE HERE %%% (≈ 3 line of code)
    [positionArray, velocityArray, accelerationArray] = evolve(n,positionArray, velocityArray, accelerationArray, radiusArray, dt);
    velocityArray = mutualCrash(n, positionArray, velocityArray, radiusArray);
    velocityArray = boundaryCrash(n, positionArray, velocityArray, radiusArray);
  %%% END CODE HERE %%%
  
  % call view() and update round
  %%% START CODE HERE %%% (≈ 1 line of code)
    view(n, positionArray, radiusArray, colorArray);
  %%% END CODE HERE %%%
  round = round + 1;
  pause(dt); % FPS control

end

% Congratulatios! This project is done (if you do not encounter bugs).
