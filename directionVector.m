function [unitDirVec, dist] = directionVector(pos1, pos2)

  %3. find the unit vector pointing from position1 to position2
  dirVec = pos2-pos1;
  dist = norm(dirVec);
  unitDirVec = dirVec/dist;

end
