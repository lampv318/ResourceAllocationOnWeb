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
  fitness = 0.99
  # puts "generate parent successfully"
  return Chromosom.new(genes, fitness, Project.strategies[:MUTATE])
end


module GeneticHelper

  def self.get_best(poolSize)
    bestParent = generate_parent
    display(bestParent)
    puts generate_code(10)
    byebug
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


