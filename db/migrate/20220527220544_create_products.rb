class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :brand_name
      t.string :product_name
      t.string :product_code
      t.float :retail_price

      t.timestamps
    end
  end
end
