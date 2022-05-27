require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      brand_name: "MyString",
      product_name: "MyString",
      product_code: "MyString",
      retail_price: 1.5
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[brand_name]"

      assert_select "input[name=?]", "product[product_name]"

      assert_select "input[name=?]", "product[product_code]"

      assert_select "input[name=?]", "product[retail_price]"
    end
  end
end
