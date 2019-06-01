class Suggestion < ApplicationRecord
  belongs_to :project

  # serialize :genes, Hash
end
