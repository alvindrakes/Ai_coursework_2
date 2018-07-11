% Function for getting the first sufficiently different solution
function soli = firstDiffSol(leader,solutions)
   % Extract basic information
   [yLeng xLeng] = size(solutions);
   numSols = yLeng;
   % Scan through solutions
   for si=1:numSols
      % Compute difference between leader and potential follower
      aDiff = compSolDiff1(leader,solutions(si,:));
      %disp(['aDiff: ' num2str(aDiff)]);
      
      for col = 1 : xLeng   % get the average of the solutions' fitness 
        theSum = 0;
        theSum = theSum + solutions(si, col);
        minDiff = theSum / xLeng;
      end
      
      probability = rand;  % get a random number 
      
      % If the difference is large enough return index of follower
      if aDiff >= minDiff
         soli = si;
         return
      elseif  probability > minDiff
          soli = si;
         return
      end 
      
   end
   % If no suitable candidate is found return -1
   soli=-1;