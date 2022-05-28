require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        brand_name: "Brand Name",
        product_name: "Product Name",
        product_code: "Product Code",
        retail_price: 2.5
      ),
      Product.create!(
        brand_name: "Brand Name",
        product_name: "Product Name",
        product_code: "Product Code",
        retail_price: 2.5
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", text: "Brand Name".to_s, count: 2
    assert_select "tr>td", text: "Product Name".to_s, count: 2
    assert_select "tr>td", text: "Product Code".to_s, count: 2
    assert_select "tr>td", text: "$2.50", count: 2
  end
end
