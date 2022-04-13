require './lib/museum'
require './lib/patron'
require './lib/exhibit'

describe Museum do

  it "exists" do
    dmns = Museum.new("Denver Museum of Nature and Science")
    expect(dmns).to be_an_instance_of(Museum)
  end

  it "has a name" do
    dmns = Museum.new("Denver Museum of Nature and Science")
    expect(dmns.name).to eq("Denver Museum of Nature and Science")
  end

  it "has no exhibits by default" do
    dmns = Museum.new("Denver Museum of Nature and Science")
    expect(dmns.exhibits).to eq([])
  end

  it "can have exhibits added" do
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals"}, {cost: 0})
    dmns.add_exhibit(gems_and_minerals)
    expect(dmns.exhibits).to eq([gems_and_minerals])
  end

  it "can recommend exhibits"
  dmns = Museum.new("Denver Museum of Nature and Science")
  gems_and_minerals = Exhibit.new({name: "Gems and Minerals"}, {cost: 0})
  dmns.add_exhibit(gems_and_minerals)
  patron1 = Patron.new("Bob", 20)
  dmns.add_patron(patron1)
  patron1.add_interest("Dead Sea Scrolls")
  patron1.add_interest("Gems and Minerals")
  expect(dmns.recommended_exhibits(patron1)).to eq(gems_and_minerals)
end
