class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :hostname
      t.integer :agency_id
      t.datetime :last_crawled

      t.timestamps
    end
  end
end
