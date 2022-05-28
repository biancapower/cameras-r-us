require 'rails_helper'

RSpec.describe Retailer, type: :model do
  it "is valid with a name and address" do
    retailer = Retailer.new(
      name: "Camcorder 360",
      address: "123 Main Street, Beeac, VIC 3251"
    )
    expect(retailer).to be_valid
  end

  it "is invalid without a name" do
    retailer = Retailer.new(name: nil)
    retailer.valid?
    expect(retailer.errors[:name]).to include("can't be blank")
  end

  it "is invalid without an address" do
    retailer = Retailer.new(address: nil)
    retailer.valid?
    expect(retailer.errors[:address]).to include("can't be blank")
  end
end
