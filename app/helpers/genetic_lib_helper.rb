module GeneticLibHelper

  def mutate_genes(genes)
    initialFitness = get_fitness(genes)
    numberOfTask = genes.length
    numberOfDev = genes[1][1].length
    index = rand(1..numberOfTask)
    taskInfo = genes[index][1].split('')
    a = 0
    for i in 0..50
      indexDev = rand(0...numberOfDev)
      if taskInfo[indexDev] == '0' 
        taskInfo[indexDev] = '1'
      else
        taskInfo[indexDev] = '0'
      end
      a = genes[index][0]
      genes[index][0] = ball_mutation(a, 10)
      genes[index][0] = 0 if genes[index][0] < 0
      genes[index][1] = taskInfo.join
      fitness = get_fitness(genes)
      return genes if fitness > initialFitness
      genes[index][0] = a
    end
    # byebug
    return genes
  end

  def ball_mutation(point, radius)
    return rand(point-radius...point+radius)
  end

  def crossover_genes(genes, donorGenes)
    if get_fitness(genes) > get_fitness(donorGenes)
      initialFitness = get_fitness(genes)
    else
      initialFitness = get_fitness(donorGenes)
    end
    length = genes.length

    for i in (0..30)
      ind = rand(1..length)
      # byebug
      genes[ind][0], donorGenes[ind][0] = donorGenes[ind][0], genes[ind][0]
      genes[ind][1], donorGenes[ind][1] = donorGenes[ind][1], genes[ind][1]

      if get_fitness(genes) > get_fitness(donorGenes)
        child = genes
      else
        child = donorGenes
      end
      return child if get_fitness(child) > get_fitness(genes)
    end
    donorGenes[ind][0], genes[ind][0] = genes[ind][0], donorGenes[ind][0]
    return genes

  end

  def mutate(parent)
    genes = mutate_genes(parent.genes)
    fitness = get_fitness(genes)
    return Chromosom.new(genes, fitness, Project.strategies[:MUTATE])
  end

  def crossover(parent, parents)
    parentDonor = roulette_selection(parents)
    while  parent == parentDonor
      parentDonor = roulette_selection(parents)
    end
    genes = crossover_genes(parent.genes, parentDonor.genes)
    fitness = get_fitness(genes)
    return Chromosom.new(genes, fitness, Project.strategies[:CROSSOVER])
  end

  def new_child(parent, parents)
    rate = rand(0..100)
    if rate > 70
      return crossover(parent, parents)
    else
      return mutate(parent)
    end
  end

  def get_best(poolSize)
    bestParent = generate_parent
    display(bestParent)

    parents = [bestParent]

    for i in 0..poolSize
      parent = generate_parent
      parents.append(parent)
      if parent.fitness > bestParent.fitness
        display(parent)
        bestParent = parent
      end
    end


    lastParentIndex = poolSize -1
    pindex = 1
    tempSelect = []
    selectedParents = []

    for k in 0..100

      parentIndex = lastParentIndex
      # select new population
      for i in 0...50
        tempParent = parents[parentIndex] 
        selectedParents.append(tempParent)
        parentIndex -= 1
      end
      tempSelect = selectedParents
      for ind in 0...50
        parent = tempSelect[ind]
        child = new_child(parent, parents)
        # child = generate_parent
        selectedParents.append(child)
        if child.fitness > bestParent.fitness
          bestParent = child
          display(bestParent)
        end
      end
      parents = selectedParents
      parents = parents.sort_by{ |parent| parent.fitness } # >> tang dan 
      selectedParents = [] 
    end
    return parents

  end

  def roulette_selection(parents)
    sum_fits = 0

    parents.each do |parent|
      sum_fits += parent.fitness
    end

    pick = rand(0..sum_fits)
    current = 0
    parents.each do |ind| 
      current += ind.fitness
      return ind if current > pick
    end
  end

end
