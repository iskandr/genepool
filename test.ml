
open GenePool

let params = { 
	nRandom = 1000; 
	nSurvivors = 20; 
	nMutations = 440; 
	nCrossovers = 440; 
	timeLimit = max_float; 
	maxGen = 10 
}

let spec = { 
	evaluate = Array.fold_left (fun count b -> if b then count + 1 else count) 0; 
	mutate =  ArrayGenome.mutatePoint not;
	crossover =  ArrayGenome.randomCrossover;
	genRandom  = ArrayGenome.mkArray 500 Random.bool;
	seed = None;
	stop = Some (fun _ _ fitness -> fitness = 500);
	report = Some (fun gen _ fitness -> Printf.printf "Generation %d, fitness: %d \n" gen fitness);
}

let genomes, bestFitness = evolve spec params

let _ =  Printf.printf "Final fitness: %d \n" bestFitness

