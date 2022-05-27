class ProductsRetailer < ApplicationRecord
  belongs_to :product
  belongs_to :retailer
end
