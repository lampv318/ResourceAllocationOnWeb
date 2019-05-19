class Chromosome < ApplicationRecord
  belongs_to :projects

  serialize :genes, Hash
  enum strategy: [:creates, :mutate, :crossover]
end
