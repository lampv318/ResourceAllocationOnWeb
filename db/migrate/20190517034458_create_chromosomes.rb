class CreateChromosomes < ActiveRecord::Migration[5.2]
  def change
    create_table :chromosomes do |t|
      t.string :genes
      t.integer :strategy
      t.float :fitness

      t.timestamps
    end
  end
end
