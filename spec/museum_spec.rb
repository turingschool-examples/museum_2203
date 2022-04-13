require "rspec"
require "./lib/museum"
require "./lib/patron"
require "./lib/exhibit"

RSpec.describe Museum do
  before(:each) do
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
  end

  it "exists" do
    expect(@dmns).to be_a(Museum)
  end

  it "has readable attributes" do
    expect(@dmns.name).to eq("Denver Museum of Nature and Science")
  end

  it "has no exhibits by default" do
    expect(@dmns.exhibits).to eq([])
  end
end
