# museum_spec.rb
require 'pry'
require 'rspec'
require './lib/exhibit'
require './lib/patron'
require './lib/museum'

describe 'Museum' do
  it 'exists' do
    dmns = Museum.new("Denver Museum of Nature and Science")

    expect(dmns).to be_an_instance_of Museum
  end

  it 'can have exhibits' do
    dmns = Museum.new("Denver Museum of Nature and Science")

    expect(dmns.exhibits).to eq []
  end

  it 'can have exhibits added to it' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)

    expect(dmns.exhibits).to eq [gems_and_minerals, dead_sea_scrolls, imax]
  end

  it 'can match patrons interests to exhibits' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    patron_1 = Patron.new("Bob", 20)
    patron_1.add_interests("Dead Sea Scrolls")
    patron_1.add_interests("Gems and Minerals")
    patron_2 = Patron.new("Sally", 20)
    patron_2.add_interests("IMAX")

    expect(dmns.recommend_exhibits(patron_1)).to eq [gems_and_minerals, dead_sea_scrolls]
    expect(dmns.recommend_exhibits(patron_2)).to eq [imax]
  end

  it 'can admit patrons' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    patron_1 = Patron.new("Bob", 20)
    patron_1.add_interests("Dead Sea Scrolls")
    patron_1.add_interests("Gems and Minerals")
    patron_2 = Patron.new("Sally", 20)
    patron_2.add_interests("IMAX")
    patron_3 = Patron.new("Johnny", 5)
    patron_3.add_interests("Dead Sea Scrolls")
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)

    expect(dmns.patrons).to eq [patron_1, patron_2, patron_3]
  end

  it 'can return a list of exhibits by interest' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    patron_1 = Patron.new("Bob", 20)
    patron_1.add_interests("Dead Sea Scrolls")
    patron_1.add_interests("Gems and Minerals")
    patron_2 = Patron.new("Sally", 20)
    patron_2.add_interests("IMAX")
    patron_3 = Patron.new("Johnny", 5)
    patron_3.add_interests("Dead Sea Scrolls")
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)

    expect(dmns.patrons_by_exhibit_interest).to eq({gems_and_minerals: [patron_1],
                                                     dead_sea_scrolls: [patron_1, patron_3],
                                                     imax: [patron_2]})
  end

  it 'can return a list of patrons that are in the lottery' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    patron_1 = Patron.new("Bob", 0)
    patron_1.add_interests("Dead Sea Scrolls")
    patron_1.add_interests("Gems and Minerals")
    patron_2 = Patron.new("Sally", 20)
    patron_2.add_interests("IMAX")
    patron_3 = Patron.new("Johnny", 5)
    patron_3.add_interests("Dead Sea Scrolls")
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)

    expect(dmns.ticket_lottery_contestants(dead_sea_scrolls)).to eq [patron_1, patron_3]
  end

  it 'can draw a winner for the lottery' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    patron_1 = Patron.new("Bob", 0)
    patron_1.add_interests("Dead Sea Scrolls")
    patron_1.add_interests("Gems and Minerals")
    patron_2 = Patron.new("Sally", 20)
    patron_2.add_interests("IMAX")
    patron_3 = Patron.new("Johnny", 5)
    patron_3.add_interests("Dead Sea Scrolls")
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)
    dmns.ticket_lottery_contestants(dead_sea_scrolls)

    # I don't know how to make the expect take an or statement
    expect(dmns.draw_lottery_winner(dead_sea_scrolls)).to eq(patron_1)
    expect(dmns.draw_lottery_winner(dead_sea_scrolls)).to eq(patron_3)
  end
end
