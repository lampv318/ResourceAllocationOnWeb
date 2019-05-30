module Strategies
  CREATE = 0 
  MUTATE = 1
  CROSSOVER = 2
end

class Chromosom   
  attr_accessor :genes
  attr_accessor :fitness
  attr_accessor :strategy

  def initialize(genes, fitness, strategy)
    @genes = genes
    @fitness = fitness
    @strategy = strategy
  end

end

def generate_code(number)
  charset = [0,1]
  Array.new(number) { charset.sample }.join
end

def generate_genes(length)
  i = 1
  genes = {}
  while i < length+1
    genesTask = []# geneTask is array 2 element
    timeSched = rand(1..100)
    genesTask.append(timeSched)
    taskInfor = generate_code(10)
    genesTask.append(taskInfor)
    genes[i] = genesTask
    i+=1
  end

  return genes
end

def display(candidate)
  print "genes: #{candidate.genes}, fitness: #{candidate.fitness}, Strategy: #{Project.strategies.key(candidate.strategy)} \n"
end

def generate_parent
  genes = generate_genes(10)
  fitness = get_fitness_of_duration(genes)
  return Chromosom.new(genes, fitness, Project.strategies[:CREATE])
end

def get_value(arr1, arr2, arr3, arr4)
  $duration = arr1
  $dependence = arr2
  $treq = arr3
  $lexp = arr4
end

module GeneticHelper
  def get_best(poolSize)
    bestParent = generate_parent
    # convert_to_arr("1 2")
    display(bestParent)
    puts generate_code(10)
    parents = [bestParent]
    for i in 0..poolSize
      parent = generate_parent
      parents.append(parent)
      if parent.fitness > bestParent.fitness
        display(parent)
        bestParent = parent
      end
    end

    for i in 0..500

    end
  end

  def self.get_improvement
    puts "concac"
  end
end

def get_fitness_of_duration(genes)
  totalDelay = 0 
  numberOfTask = $duration.count
  for i in 1..numberOfTask
    timeSched = genes[i][0]
    timeStart = get_time_start(genes, i)
    timeDelay = get_time_delay(timeSched, timeStart)
    totalDelay += timeDelay
  end
  return totalDelay/$duration.count
end

def get_time_start(genes, taskIndex)
  timeStartMax = 0
  for i in 0..$dependence.count-1
    if $dependence[i][1] == taskIndex
      timeSched = genes[$dependence[i][0]][0]
      timeDuration = $duration[$dependence[i][0]-1][1] 
      timeTemp = timeSched + timeDuration
      if timeStartMax < timeTemp
        timeStartMax = timeTemp
      end
    end
  end
  return timeStartMax
end

def get_time_delay(timeSched, timeStart)
  if timeSched < timeStart
    return 0
  else
    return Float(1)/(1 + (timeSched - timeStart))  
  end
end


