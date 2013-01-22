class CreateDatasetAttributes < ActiveRecord::Migration
  def change
    create_table :dataset_attributes do |t|
      t.integer :dataset_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
