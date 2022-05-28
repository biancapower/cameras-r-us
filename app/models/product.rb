class Product < ApplicationRecord
	has_and_belongs_to_many :retailers

	validates :product_name, :brand_name, presence: true
	validates :retail_price, numericality: true
end
