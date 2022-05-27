require 'rails_helper'

RSpec.describe "retailers/show", type: :view do
  before(:each) do
    @retailer = assign(:retailer, Retailer.create!(
      name: "Name",
      address: "Address",
      maps_url: "Maps Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Maps Url/)
  end
end
