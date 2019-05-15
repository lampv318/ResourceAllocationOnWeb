class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.text :dependence
      t.text :matrix_experience
      t.integer :user_id

      t.timestamps
    end
  end
end
