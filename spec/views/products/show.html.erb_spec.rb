require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      brand_name: "Brand Name",
      product_name: "Product Name",
      product_code: "Product Code",
      retail_price: 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Brand Name/)
    expect(rendered).to match(/Product Name/)
    expect(rendered).to match(/Product Code/)
    expect(rendered).to match(/2.5/)
  end
end
