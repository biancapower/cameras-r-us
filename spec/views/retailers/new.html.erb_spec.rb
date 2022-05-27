require 'rails_helper'

RSpec.describe "retailers/new", type: :view do
  before(:each) do
    assign(:retailer, Retailer.new(
      name: "MyString",
      address: "MyString",
      maps_url: "MyString"
    ))
  end

  it "renders new retailer form" do
    render

    assert_select "form[action=?][method=?]", retailers_path, "post" do

      assert_select "input[name=?]", "retailer[name]"

      assert_select "input[name=?]", "retailer[address]"

      assert_select "input[name=?]", "retailer[maps_url]"
    end
  end
end
