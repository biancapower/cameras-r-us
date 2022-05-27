class CreateProductsRetailers < ActiveRecord::Migration[6.1]
  def change
    create_table :products_retailers do |t|
      t.references :product, null: false, foreign_key: true
      t.references :retailer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
