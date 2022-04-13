require 'rspec'
require 'pry'
require './lib/museum'
describe Museum do
  context 'iteration 2' do
    before(:each) do
      @dmns = Museum.new("Denver Museum of Nature and Science")
      @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      @imax = Exhibit.new({name: "IMAX",cost: 15})
      @patron_1 = Patron.new("Bob", 20)
      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_1.add_interest("Gems and Minerals")
      @patron_2 = Patron.new("Sally", 20)
      @patron_2.add_interest("IMAX")
    end
    it 'exists' do
      expect(@dmns).to be_an_instance_of(Museum)
    end
    it 'has a readable name' do
      expect(@dmns.name).to eq("Denver Museum of Nature and Science")
    end
    it 'has no exhibits by default' do
      expect(@dmns.exhibits).to eq([])
    end
    it 'can add exhibits' do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
      expect(@dmns.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls, @imax])
    end
    it 'can recommend exhibits based on patron interests' do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
      expect(@dmns.recommend_exhibits(@patron_1)).to eq([@gems_and_minerals, @dead_sea_scrolls])
      expect(@dmns.recommend_exhibits(@patron_2)).to eq([@imax])
    end
  end
  context 'iteration 3' do
    before(:each) do
      @dmns = Museum.new("Denver Museum of Nature and Science")
      @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      @imax = Exhibit.new({name: "IMAX",cost: 15})
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
      @patron_1 = Patron.new("Bob", 0)
      @patron_1.add_interest("Gems and Minerals")
      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_2 = Patron.new("Sally", 20)
      @patron_2.add_interest("Dead Sea Scrolls")
      @patron_3 = Patron.new("Johnny", 5)
      @patron_3.add_interest("Dead Sea Scrolls")
    end
    it 'has no patrons by default' do
      expect(@dmns.patrons).to eq([])
    end
    it 'can admit patrons' do
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)
      expect(@dmns.patrons).to eq(@patron_1, @patron_2, @patron_3)
    end
    it 'can list all patrons who are interested in an exhibit in a hash' do
      expect(@dmns.patrons_by_exhibit_interest).to be_a(Hash)
      expect(@dmns.patrons_by_exhibit_interest[@dead_sea_scrolls]).to eq([@patron1, @patron_2, @patron_3])
      expect(@dmns.patrons_by_exhibit_interest[@imax]).to eq([])
    end
  end
end
