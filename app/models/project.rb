class Project < ApplicationRecord
  belongs_to :user
  has_many :chromosomes

  enum strategies: { CREATE: 0, MUTATE: 1, CROSSOVER: 2}
end
