class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.string :title
      t.text :description
      t.string :documentation_url
      t.string :url
      t.datetime :last_updated
      t.integer :agency_id
      t.string :contact_name
      t.string :contact_email
      t.boolean :public

      t.timestamps
    end
  end
end
