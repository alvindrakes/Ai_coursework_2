% Mutated simulated annealing algorithm 

function [solutions] = SimulatedAnnealing(firstSolution, allSolutions,  funcName, data, verbose, gsoParams) 

coolingFactor = 0.9;  % used for colling down the temp

cutOffTemp = 0.001;   % one of the stopping criteria 

Temp = 50; % initial temperature

problemSize = size(allSolutions, 1); % size of solutions

currentFitnessTemp = evaluateSolutionsCC(firstSolution, funcName, data, verbose); % calculate & get 1st solution fitness 
currentFitness = currentFitnessTemp(1,1);

updatedSolutions = [];

i = 1;

while(Temp > cutOffTemp && i <= problemSize)

    for row = 1:problemSize % Loop through all solutions 
        
            y = ceil(rand(1,1)*(24));
            
            newSolPoint = mutateThis(allSolutions(y, :), gsoParams);  % get random solution by mutating the chosen solution based on probability 
            
    
            newFitness = evaluateSolutionsCC(newSolPoint, funcName, data, verbose);  % calculate new solution fitness 
     
            deltaE = newFitness(1,1) - currentFitness(1,1);  % calculate difference btw newFitness & currentFitness 
     
            probability = 1 ./ (1 + exp(deltaE / Temp));  % sigmoid function for probability 
        
    
            if( newFitness(1,1) < currentFitness(1,1) )
			
                		currentFitness = newFitness;
                    
                        currentSol = newSolPoint;  % replace old solution with new solution point if it's better
                       
                        Temp = Temp * coolingFactor;  

            elseif (rand('double') <= probability)  % if the random number is lower of equal to the probability, accept the worsen new solution
															
                		currentFitness  = newFitness;
                    
                        currentSol = newSolPoint;   
                  
                        Temp = Temp * coolingFactor;                
            else
                        currentSol = allSolutions(row, :);  % remain in place if newFitness is not better 
            
            end
         updatedSolutions(row, :) = currentSol; % add all changed solutions into updatedSolutions 
    end
    i = i + 1;  % keep track the number of iterations
end
     
    solutions = updatedSolutions;  
end


