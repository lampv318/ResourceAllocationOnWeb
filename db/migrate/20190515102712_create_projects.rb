class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.text :dependence
      t.text :matrix_experience
      t.integer :user_id
      t.integer :number_of_task
      t.integer :number_of_develop

      t.timestamps
    end
  end
end
