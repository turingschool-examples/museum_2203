require './lib/patron'

describe Patron do

  it "exists" do
  patron = Patron.new("Bob", 20)
  expect(patron).to be_an_instance_of(Patron)
  end

  it "has a name" do
    patron = Patron.new("Bob", 20)
    expect(patron.name).to eq("Bob")
  end

  it "has spending money" do
    patron = Patron.new("Bob", 20)
    expect(patron.spending_money).to eq(20)
  end

  it "has no interests by default" do
    patron = Patron.new("Bob", 20)
    expect(patron.interests).to eq([])
  end

  it "can have interests added" do
    patron = Patron.new("Bob", 20)
    patron.add_interest("Dead Sea Scrolls")
    patron.add_interest("Gems and Minerals")
    expect(patron.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
  end
end
