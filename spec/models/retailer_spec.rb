require 'rails_helper'

RSpec.describe Retailer, type: :model do
  it "is valid with a name, address and maps_url" do
    retailer = Retailer.new(
      name: "Camcorder 360",
      address: "123 Main Street, Beeac, VIC 3251",
      maps_url: "https://maps.google.com/?q=123+Main+St,+Beeac+VIC+3251,+Australia&ftid=0x6ad3a6b81f62c6d3:0x29be25d25de5c459"
    )
    expect(retailer).to be_valid
  end

  it "is invalid without a name" do
    retailer = Retailer.new(name: nil)
    retailer.valid?
    expect(retailer.errors.values).to include("Please enter a name")
  end

  it "is invalid without a maps_url" do
    retailer = Retailer.new(
      name: "Camcorder 360",
      address: "123 Main Street, Beeac, VIC 3251"
    )
    retailer.valid?
    expect(retailer.errors.values).to include("Please select a valid address from the dropdown")
  end
end
