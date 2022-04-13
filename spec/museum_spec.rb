require 'rspec'
require './lib/exhibit'
require './lib/patron'
require './lib/museum'
require 'pry'

describe Museum do
  before :each do
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    @patron_1 = Patron.new("Bob", 20)
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    @patron_2 = Patron.new("Sally", 20)
    @patron_2.add_interest("IMAX")
  end

  it 'exists' do
    expect(@dmns).to be_a(Museum)
  end

  it 'has a name' do
    expect(@dmns.name).to eq("Denver Museum of Nature and Science")
  end

  xit 'has no exhibits' do
    expect(@dmns.exhibits).to eq([])
  end

  it 'can add exhibits' do
    expect(@dmns.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls, @imax])
  end

  it 'can recommend exhibits based on interests' do
    expect(@dmns.recommend_exhibits(@patron_1)).to eq([@dead_sea_scrolls, @gems_and_minerals])
    expect(@dmns.recommend_exhibits(@patron2)).to eq([@imax])
  end

  it 'has patron by exhibit interest hash' do

  end
end
