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
  fitness = get_fitness(genes, 0.9, 0.1)
  # genes = {1=>[49, "0000000101"], 2=>[35, "0000000100"], 3=>[61, "0001000000"],
  #   4=>[67, "0000000101"], 5=>[44, "0000000100"], 6=>[19, "0000000100"], 
  #   7=>[62, "0000010000"], 8=>[56, "0000000001"], 9=>[34, "0000000100"], 10=>[95, "0001000000"]}
  # fitness = get_fitness_of_exp(genes)
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

def get_fitness(genes, weighted_of_finess_1, weighted_of_finess_2)
  fitness_first = get_fitness_of_duration(genes)*weighted_of_finess_1
  fitness_second = get_fitness_of_exp(genes)*weighted_of_finess_2
  fitness_third = get_fitness_of_assignment(genes)
  return (fitness_first + fitness_second + fitness_third)*0.5
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

def get_fitness_of_exp(genes)
  numberOfTask = genes.count
  assignedDevelop = []
  temp = 0
  for i in 1..numberOfTask 
    taskInfor = genes[i][1]
    for k in 0...taskInfor.length
      if taskInfor[k] == "1"
        assignedDevelop.append(k+1)
      end
    end
    temp += ex_all_of_task(i, assignedDevelop)
  end
  return temp/numberOfTask
end

def ex_all_of_task(indexOfTask, assignedDevelop)
  task_exp = 0
  numberOfSkill = 0
  count = $treq[1].count
  for i in 0..count
    if $treq[indexOfTask][i] == 1
      numberOfSkill += 1
      task_exp += total_experience(assignedDevelop, i)
    end
  end
  return task_exp/numberOfSkill
end

def total_experience(assignedDevelop, indexOfSkill)
  numberOfDevelop = assignedDevelop.count
  return 0 if numberOfDevelop == 0
  treq_exp_ik = 0
  max_exp = 0
  for i in 0...numberOfDevelop
    index = assignedDevelop[i]
    if max_exp < $lexp[index][indexOfSkill]
      max_exp = $lexp[index][indexOfSkill]
    end
    treq_exp_ik += $lexp[index][indexOfSkill]
  end
  return max_exp + treq_exp_ik/numberOfDevelop
end

def get_fitness_of_assignment(genes)
  numberDevelop = genes[1][1].length
  taskAssignment = 0
  for i in 0...numberDevelop #develop
    timeTask = []
    numberOfConflict = 0
    numberOfAssignment = 0
    assgnmentTask = []
    for k in 1..genes.count # k = task
      assgnmentTask.append(k) if genes[k][1][i] == "1"
    end
    for j in 0...assgnmentTask.count
      temp = []
      temp.append(genes[assgnmentTask[j]][0])
      timeFinish = genes[assgnmentTask[j]][0] + $duration[assgnmentTask[j]-1][1]
      temp.append(timeFinish)
      timeTask.append(temp)
      numberOfAssignment +=1
    end
    numberOfConflict = CaculateConflict(timeTask)
    if numberOfAssignment == 0
      taskAssignment += 1
    else
      taskAssignment += 1 - Float(numberOfConflict)/assgnmentTask.count
    end
  end
  return taskAssignment/numberDevelop
end

def CaculateConflict(arr)
  numberOfConflict = 0
  for i in 0...arr.count
    for k in 0...arr.count
      next if k == i 
      if arr[i][1] > arr[k][0] && arr[i][1] < arr[k][1]
        numberOfConflict += 1
      end
    end
  end
  return numberOfConflict
end
