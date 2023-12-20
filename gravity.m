function f = gravity(pos1, pos2, r1, r2)

  GRAVITATIONAL_CONSTANT = 1000;

  %5. calculate the force produced by ball1 on ball2. 
  %     Ball1 is at position1, with radius r1.
  %     Ball2 is at position2, with radius r2.
  [unitDirVec, dirVecMagnitude] = directionVector(pos1, pos2);
  f = -GRAVITATIONAL_CONSTANT*unitDirVec*r1^3*r2^3/dirVecMagnitude^2;

end
