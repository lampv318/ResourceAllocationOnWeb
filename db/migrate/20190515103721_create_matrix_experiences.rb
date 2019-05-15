class CreateMatrixExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :matrix_experiences do |t|
      t.integer :project_id

      t.timestamps
    end
  end
end
