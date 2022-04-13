require 'rspec'
require './lib/patron'

describe Patron do
  it "exists" do
    patron_1 = Patron.new("Bob", 20)
    expect(patron_1).to be_an_instance_of(Patron)
  end

  it "gets name" do
    patron_1 = Patron.new("Bob", 20)
    expect(patron_1.name).to eq("Bob")
  end

  it "gets spending money" do
    patron_1 = Patron.new("Bob", 20)
    expect(patron_1.spending_money).to eq(20)
  end

  it "patron has interests" do
    patron_1 = Patron.new("Bob", 20)
    expect(patron_1.interests).to eq([])
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    expect(patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
  end

end
