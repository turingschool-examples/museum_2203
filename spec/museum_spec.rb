require './lib/exhibit'
require './lib/patron'
require './lib/museum'

RSpec.describe Museum do

  it "exists" do
    dmns = Museum.new("Denver Museum of Nature and Science")
    expect(dmns).to be_an_instance_of(Museum)
  end

  it "has readable attributes" do
    dmns = Museum.new("Denver Museum of Nature and Science")
    expect(dmns.name).to eq("Denver Museum of Nature and Science")
    expect(dmns.exhibits).to eq([])
  end

  it "can add exhibits" do
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    expect(dmns.exhibits.length).to eq(3)
  end

  it "can reccommend exhibits " do
    dmns = Museum.new("Denver Museum of Nature and Science")
    patron_1 = Patron.new("Bob", 20)
    patron_2 = Patron.new("Sally", 20)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    patron_2.add_interest("IMAX")
    expect(dmns.reccommend_exhibits(patron_1).length).to eq(2)
    expect(dmns.reccommend_exhibits(patron_2).length).to eq(1)
  end

  it "can admit patrons regardless of money" do
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    expect(dmns.patrons).to eq([])
    patron_1 = Patron.new("Bob", 0)
    patron_2 = Patron.new("Sally", 20)
    patron_3 = Patron.new("Johnny", 5)
    patron_1.add_interest("Gems and Minerals")
    patron_1.add_interest("Dead Sea Scrolls")
    patron_2.add_interest("Dead Sea Scrolls")
    patron_3.add_interest("Dead Sea Scrolls")
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)
    expect(dmns.patrons.length).to eq(3)
  end

  it "makes hash of patrons by exhibit iterests " do
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    expect(dmns.patrons).to eq([])
    patron_1 = Patron.new("Bob", 0)
    patron_2 = Patron.new("Sally", 20)
    patron_3 = Patron.new("Johnny", 5)
    patron_1.add_interest("Gems and Minerals")
    patron_1.add_interest("Dead Sea Scrolls")
    patron_2.add_interest("Dead Sea Scrolls")
    patron_3.add_interest("Dead Sea Scrolls")
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)
    # require 'pry';binding.pry
    expect(dmns.patrons_by_exhibit_interest).to be_a(Hash)
    expect(dmns.patrons_by_exhibit_interest.keys).to eq([gems_and_minerals,dead_sea_scrolls,imax])
  end

  it "adds patrons to lottery" do
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    expect(dmns.patrons).to eq([])
    patron_1 = Patron.new("Bob", 0)
    patron_2 = Patron.new("Sally", 20)
    patron_3 = Patron.new("Johnny", 5)
    patron_1.add_interest("Gems and Minerals")
    patron_1.add_interest("Dead Sea Scrolls")
    patron_2.add_interest("Dead Sea Scrolls")
    patron_3.add_interest("Dead Sea Scrolls")
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)
    # require 'pry';binding.pry
    expect(dmns.ticket_lottery_contestants(dead_sea_scrolls)).to eq([patron_1,patron_3])
  end

  it "can draw a lottery winner" do
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    expect(dmns.patrons).to eq([])
    patron_1 = Patron.new("Bob", 0)
    patron_2 = Patron.new("Sally", 20)
    patron_3 = Patron.new("Johnny", 5)
    patron_1.add_interest("Gems and Minerals")
    patron_1.add_interest("Dead Sea Scrolls")
    patron_2.add_interest("Dead Sea Scrolls")
    patron_3.add_interest("Dead Sea Scrolls")
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)
    expect(dmns.draw_lottery_winner(dead_sea_scrolls)).to eq("Johnny")
  end
end
