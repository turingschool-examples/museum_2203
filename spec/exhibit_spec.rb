require './lib/patron'
require './lib/exhibit'

describe Exhibit do
  it "exists" do
    exhibit = Exhibit.new({name: "Gems and Minerals"}, {cost: 0})
    expect(exhibit).to be_an_instance_of(Exhibit)
  end

  it "has a name" do
    exhibit = Exhibit.new({name: "Gems and Minerals"}, {cost: 0})
    expect(exhibit.name).to eq("Gems and Minerals")
  end

  it "has a cost" do
    exhibit = Exhibit.new({name: "Gems and Minerals"}, {cost: 0})
    expect(exhibit.cost).to eq(0)
  end

  it "has no patrons by default" do
    exhibit = Exhibit.new({name: "Gems and Minerals"}, {cost: 0})
    expect(exhibit.patrons).to eq([])
  end

  it "can have patrons" do
    exhibit = Exhibit.new({name: "Gems and Minerals"}, {cost: 0})
    patron1 = Patron.new("Bob", 20)
    exhibit.add_patron(patron1)
    expect(exhibit.patrons).to eq([patron1])
  end

  it "can tell us patron interests" do
    exhibit = Exhibit.new({name: "Gems and Minerals"}, {cost: 0})
    patron1 = Patron.new("Bob", 20)
    exhibit.add_patron(patron1)
    patron1.add_interest("Dead Sea Scrolls")
    patron1.add_interest("Gems and Minerals")
    expect(patron1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
  end
end
