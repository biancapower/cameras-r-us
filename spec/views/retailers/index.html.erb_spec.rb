require 'rails_helper'

RSpec.describe "retailers/index", type: :view do
  before(:each) do
    assign(:retailers, [
      Retailer.create!(
        name: "Name",
        address: "Address",
        maps_url: "Maps Url"
      ),
      Retailer.create!(
        name: "Name",
        address: "Address",
        maps_url: "Maps Url"
      )
    ])
  end

  it "renders a list of retailers" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Address".to_s, count: 2
  end
end
