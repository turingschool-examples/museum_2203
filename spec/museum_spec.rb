require './lib/exhibit'
require './lib/patron'
require './lib/museum'
require 'pry'

RSpec.describe Museum do
  before :each do
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
  end

  it "exists and has attributes" do
    expect(@dmns).to be_a(Museum)
    expect(@dmns.name).to eq("Denver Museum of Nature and Science")
    expect(@dmns.exhibits).to eq([])
  end


  it 'displays the exhibits in an array' do
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    expected = [@gems_and_minerals, @dead_sea_scrolls, @imax]
    expect(@dmns.exhibits).to eq(expected)
  end

  it 'will recommend exhibits to patrons' do
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    @patron_1 = Patron.new("Bob", 20)
    @patron_2 = Patron.new("Sally", 20)
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    @patron_2.add_interest("IMAX")
    #I need to create a path from the patrons interest(string) to the
    #actual exhibit(dmns object)
    expect(@dmns.recommend_exhibits(@patron_1)).to eq([@gems_and_minerals, @dead_sea_scrolls])
    # expect(@dmns.recommend_exhibits(@patron_2)).to eq([@imax])
  end
end
