class AddCacheColumnToDataset < ActiveRecord::Migration
  def change
    change_table :datasets do |t|
      t.integer :score, :default => 0 
    end
    add_index :datasets, [:score]
  end
end
