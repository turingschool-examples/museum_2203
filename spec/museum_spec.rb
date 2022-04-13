require 'rspec'
require './lib/museum'

describe Museum do

  before(:each) do
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})

    @patron_1 = Patron.new("Bob", 0)
    @patron_2 = Patron.new("Sally", 20)
    @patron_3 = Patron.new("Johnny", 5)
    @tj = Patron.new("TJ", 7)
    @morgan = Patron.new("Morgan", 15)

    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    @patron_2.add_interest("Dead Sea Scrolls")
    @patron_3.add_interest("Dead Sea Scrolls")
    @tj.add_interest("IMAX")
    @tj.add_interest("Dead Sea Scrolls")
    @morgan.add_interest("Gems and Minerals")
    @morgan.add_interest("Dead Sea Scrolls")
  end

  it 'exists' do
    expect(@dmns).to be_a(Museum)
  end

  it 'had readable attributes' do
    expect(@dmns.name).to eq("Denver Museum of Nature and Science")
    expect(@dmns.exhibits).to eq([])
    expect(@dmns.patrons).to eq([])
  end

  it 'can add exhibits' do
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    expect(@dmns.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls, @imax])
  end

  it 'can recommend exhibits for patrons' do
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    expect(@dmns.recommend_exhibits(@patron_1)).to eq([@gems_and_minerals, @dead_sea_scrolls])
    expect(@dmns.recommend_exhibits(@patron_2)).to eq([@dead_sea_scrolls])
  end

  it 'can admit patrons' do
    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)

    expect(@dmns.patrons).to eq([@patron_1, @patron_2, @patron_3])
  end

  it 'can organize patrons by exhibit interest' do
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)

    expect(@dmns.patrons_by_exhibit_interest).to eq({@gems_and_minerals => [@patron_1], @dead_sea_scrolls => [@patron_1, @patron_2, @patron_3], @imax => []})
  end

  it 'can return patrons that do not have enough money to see the exhibit they want' do
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)

    expect(@dmns.ticket_lottery_contestants(@dead_sea_scrolls)).to eq([@patron_1, @patron_3])
  end

  it 'can draw lottery winner' do
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)

    expect(@dmns.draw_lottery_winner(@dead_sea_scrolls)).to eq("Johnny").or eq("Bob")
    expect(@dmns.draw_lottery_winner(@gems_and_minerals)).to eq(nil)
  end

  it 'can update patrons spending money when they are admitted' do
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)
    @dmns.admit(@tj)
    @dmns.admit(@morgan)

    expect(@tj.spending_money).to eq(7)
    expect(@patron_1.spending_money).to eq(0)
    expect(@patron_2.spending_money).to eq(10)
    expect(@morgan.spending_money).to eq(5)
  end

  it 'can add to museum revenue when patrons admitted' do
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)
    @dmns.admit(@tj)
    @dmns.admit(@morgan)

    expect(@dmns.revenue).to eq(20)
  end

end
