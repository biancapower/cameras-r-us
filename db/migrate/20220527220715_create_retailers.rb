class CreateRetailers < ActiveRecord::Migration[6.1]
  def change
    create_table :retailers do |t|
      t.string :name
      t.string :address
      t.string :maps_url

      t.timestamps
    end
  end
end
