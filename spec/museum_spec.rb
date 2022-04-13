require 'rspec'
require './lib/museum'

RSpec.describe 'Museum' do
  describe 'attributes' do
    before(:each) do
      @dmns = Museum.new('Denver Museum of Nature and Science')
    end

    it 'has a name' do
      expect(@dmns.name).to eq 'Denver Museum of Nature and Science'
    end

    it 'has exhibits' do
      expect(@dmns.exhibits).to eq []
    end
  end

  describe 'behaviors' do
    before(:each) do
      @dmns = Museum.new('Denver Museum of Nature and Science')
      @gems_and_minerals = Exhibit.new({ name: 'Gems and Minerals', cost: 0 })
      @dead_sea_scrolls = Exhibit.new({ name: 'Dead Sea Scrolls', cost: 10 })
      @imax = Exhibit.new({ name: 'IMAX', cost: 15 })
      @patron_1 = Patron.new('Bob', 20)
      @patron_1.add_interest('Dead Sea Scrolls')
      @patron_1.add_interest('Gems and Minerals')
      @patron_2 = Patron.new('Sally', 20)
      @patron_2.add_interest('IMAX')
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
    end
    it 'adds exhibits' do
      expect(@dmns.exhibits).to eq [@gems_and_minerals, @dead_sea_scrolls, @imax]
    end

    it ' reccomends exhibits' do
      expect(@dmns.reccomend_exhibits(@patron_1)).to eq [@gems_and_minerals, @dead_sea_scrolls]
      expect(@dmns.reccomend_exhibits(@patron_2)).to eq [@imax]
    end
  end
  describe 'I3' do
    before(:each) do
      @dmns = Museum.new('Denver Museum of Nature and Science')
      @gems_and_minerals = Exhibit.new({ name: 'Gems and Minerals', cost: 0 })
      @dead_sea_scrolls = Exhibit.new({ name: 'Dead Sea Scrolls', cost: 10 })
      @imax = Exhibit.new({ name: 'IMAX', cost: 15 })
      @patron_1 = Patron.new('Bob', 0)
      @patron_1.add_interest('Dead Sea Scrolls')
      @patron_1.add_interest('Gems and Minerals')
      @patron_2 = Patron.new('Sally', 20)
      @patron_2.add_interest('Dead Sea Scrolls')
      @patron_3 = Patron.new('Johnny', 5)
      @patron_3.add_interest('Dead Sea Scrolls')
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
    end
    it 'has patrons' do
      expect(@dmns.patrons).to eq []
    end

    it 'can admit patrons' do
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)
      expect(@dmns.patrons).to eq [@patron_1, @patron_2, @patron_3]
    end

    it 'can list patrons by exhibit interest' do
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)
      expect(@dmns.patrons_by_exhibit_interest).to eq(
        {@imax => [], @dead_sea_scrolls => [@patron_1, @patron_2, @patron_3], @gems_and_minerals => [@patron_1]}
      )
    end
    it 'can find lottery contestants' do
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)
      expect(@dmns.ticket_lottery_contestants(@dead_sea_scrolls)).to eq [@patron_1, @patron_3]
    end

    it 'can draw from eligible lottery contestants' do
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)
      expect(@dmns.draw_lottery_winner(@dead_sea_scrolls)).to eq('Johnny').or eq('Bob')
      expect(@dmns.draw_lottery_winner(@gems_and_minerals)).to eq nil
    end
  end
end

