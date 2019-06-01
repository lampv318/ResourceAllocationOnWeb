class CreateSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :suggestions do |t|
      t.integer :project_id
      t.string :genes
      t.integer :strategy
      t.float :fitness
      t.string :chromosome

      t.timestamps
    end
  end
end
