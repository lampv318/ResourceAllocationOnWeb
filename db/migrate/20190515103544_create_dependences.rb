class CreateDependences < ActiveRecord::Migration[5.2]
  def change
    create_table :dependences do |t|
      t.integer :project_id

      t.timestamps
    end
  end
end
