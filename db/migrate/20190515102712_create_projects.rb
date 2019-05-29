class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.text :duration
      t.text :dependence
      t.text :matrix_experiment
      t.text :level_experience
      t.integer :user_id
      t.integer :number_of_task
      t.integer :number_of_develop
      t.float :weighted_of_fitness_1
      t.float :weighted_of_fitness_2

      t.timestamps
    end
  end
end
