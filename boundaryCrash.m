function newVelocityArray = boundaryCrash(n, positionArray, velocityArray, radiusArray)
  newVelocityArray = zeros(n, 2);
  for i = 1:n
    newVelocityArray(i, :) = singleBoundaryCrash(positionArray(i, :), velocityArray(i, :), radiusArray(i));
  end
end

function newVelocity = singleBoundaryCrash(position, velocity, radius)
  newVelocity = velocity;
  if position(1)-radius<-10 || position(1)+radius>10
    newVelocity = [-sign(position(1))*abs(velocity(1)), velocity(2)];
  end
  if position(2)-radius<-10 || position(2)+radius>10
    newVelocity = [velocity(1), -sign(position(2))*abs(velocity(2))];
  end
end
