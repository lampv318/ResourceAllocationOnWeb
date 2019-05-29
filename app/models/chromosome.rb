class Chromosome < ApplicationRecord
  belongs_to :projects

  serialize :genes, Hash
  enum strategy: [:creates, :mutate, :crossover]

  # class << self
  #   def generate_genes(length)
  #     i = 1
  #     genes = {}
  #     while i < length+1
  #       genesTask = []# geneTask is array 2 element
  #       timeSched = 5 # random
  #       genesTask.append(timeSched)
  #       taskInfor = [011110]
  #       genesTask.append(taskInfor)
  #       genes[i] = genesTask
  #       i+=1
  #     end
  #     puts genes
  #     # genes = { k: [] for k in range(1, length +1 )}
  #     # for i in range(0, length):
  #     #   genesTask, taskInfor = [], []
  #     #   timeSched = generate_time_sched(genes, i, arrayOfDependencies, arrayOfDuration)
  #     #   genesTask.append(timeSched)
  #     #   while len(taskInfor) < length:
  #     #     sampleSize = min(length - len(genesTask), len(geneSet))
  #     #     taskInfor.extend(random.sample(geneSet, sampleSize))
  #     #   taskInfor = ''.join(taskInfor)
  #     #   genesTask.append(taskInfor) 
  #     #   genes[i+1] = genesTask

  #     return genes
  #   end
  # end

  def get_best
    
  end

  def generate_parent

    return 0
  end
end

class Genes < Chromosome 

end
