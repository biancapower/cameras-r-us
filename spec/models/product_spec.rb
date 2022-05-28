require 'rails_helper'

RSpec.describe Product, type: :model do
  it "is valid with a product name, brand name, and retail price" do
    product = Product.new(
      product_name: "Camcorder 360",
      brand_name: "Koduck",
      retail_price: 52.99
    )
    expect(product).to be_valid
  end

  it "is invalid without a product name" do
    product = Product.new(product_name: nil)
    product.valid?
    expect(product.errors[:product_name]).to include("can't be blank")
  end

  it "is invalid without a brand name" do
    product = Product.new(brand_name: nil)
    product.valid?
    expect(product.errors[:brand_name]).to include("can't be blank")
  end

  it "is invalid if retail price is not numerical" do
    product = Product.new(retail_price: "fred")
    product.valid?
    expect(product.errors[:retail_price]).to include("is not a number")
  end
end
