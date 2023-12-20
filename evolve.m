function [newPositionArray, newVelocityArray, newAccelerationArray] = evolve(n, positionArray, velocityArray, accelerationArray, radiusArray, dt)

  %4. calculate the new positions, speeds of the balls
  newPositionArray = positionArray+velocityArray*dt;
  newVelocityArray = velocityArray+accelerationArray*dt;

  %7. calculate the new accelerations of the balls
  newAccelerationArray = updateAcc(n, positionArray, radiusArray);

end


function newAccelerationArray = updateAcc(n, positionArray, radiusArray)

  %6. calculate the acceleration of the balls.
  newAccelerationArray = zeros(n,2);
  for i=1:n
    totalForce = [0 0];
    for j=1:n
      if(i~=j)
        totalForce = totalForce+gravity(positionArray(j,:),positionArray(i,:),radiusArray(j),radiusArray(i));
      end
    end
    iAcc = totalForce/radiusArray(i)^3;
    newAccelerationArray(i,:) = iAcc;
  end

end
