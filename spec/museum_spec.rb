require './lib/exhibit.rb'
require './lib/patron.rb'
require './lib/museum.rb'
require 'rspec'
require 'pry'

RSpec.describe Patron do
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    patron_1 = Patron.new("Bob", 20)
    patron_2 = Patron.new("Sally", 20)

  it "exists" do
    expect(dmns).to be_an_instance_of(Museum)
    expect(gems_and_minerals).to be_an_instance_of(Exhibit)
    expect(dead_sea_scrolls).to be_an_instance_of(Exhibit)
    expect(imax).to be_an_instance_of(Exhibit)
    expect(patron_1).to be_an_instance_of(Patron)
    expect(patron_2).to be_an_instance_of(Patron)
  end

  it "gives the museum a name" do
    expect(dmns.name).to eq "Denver Museum of Nature and Science"
  end

  it "sets each museums exhibits to an empty array by default" do
    expect(dmns.exhibits).to eq []
  end

  it "can add exhibits to the museums exhibits array" do
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    expect(dmns.exhibits).to eq [gems_and_minerals, dead_sea_scrolls, imax]
  end

  it "can reccomend exhibits based off of patrons interests" do
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    patron_2.add_interest("IMAX")
    # binding.pry
    expect(dmns.recommended_exhbits(patron_1)).to eq ["Dead Sea Scrolls", "Gems and Minerals"]
    expect(dmns.recommended_exhbits(patron_2)).to eq ["IMAX"]
  end
end
