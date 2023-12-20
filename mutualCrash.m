function newVelocityArray = mutualCrash(n, positionArray, velocityArray, radiusArray)

  newVelocityArray = velocityArray;
  %9. check if there is a collision, if so, deal with the collision.
  for i = 1:n
    for j = i+1:n
      if radiusArray(i)+radiusArray(j)>norm(positionArray(i, :)-positionArray(j, :))
        [newVelocityArray(i, :), newVelocityArray(j, :)] = ...
          singleMutualCrash(positionArray(i, :), positionArray(j, :), velocityArray(i, :), velocityArray(j, :), radiusArray(i), radiusArray(j));
      end
    end
  end

end


function [newVelocity1, newVelocity2] = singleMutualCrash(position1, position2, velocity1, velocity2, radius1, radius2)


  %8. calculate the speed after ball1 collide with ball2.
  %8.1 calculate the radial and tangential speed components
  unitDirVector = directionVector(position1, position2);
  radialVelocity1 = dot(velocity1, unitDirVector)*unitDirVector;
  tangentialVelocity1 = velocity1-radialVelocity1;
  radialVelocity2 = dot(velocity2, unitDirVector)*unitDirVector;
  tangentialVelocity2 = velocity2-radialVelocity2;

  %8.2 calculate radial speed of center of mass.
  m1 = radius1^3;
  m2 = radius2^3;

  %8.3 calculate final speed.
  newVelocity1 = ((m1-m2)*radialVelocity1 + 2*m2*radialVelocity2)/(m1+m2);
  newVelocity2 = ((m2-m1)*radialVelocity2 + 2*m1*radialVelocity1)/(m1+m2);
  newVelocity1 = newVelocity1+tangentialVelocity1;
  newVelocity2 = newVelocity2+tangentialVelocity2;


end
