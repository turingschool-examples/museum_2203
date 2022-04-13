require './lib/museum'
require './lib/exhibit'
require './lib/patron'

RSpec.describe do

  it 'exists and has attributes' do

    dmns = Museum.new("Denver Museum of Nature and Science")

    expect(dmns.name).to eq('Denver Museum of Nature and Science')
  end

  it 'can add exhibits' do

    dmns = Museum.new("Denver Museum of Nature and Science")


    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})

    expect(dmns.exhibits).to eq([])

    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)

    expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])
  end

  it 'can recommend exhibits' do

    dmns = Museum.new("Denver Museum of Nature and Science")


    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})

    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)

    patron_1 = Patron.new("Bob", 20)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")

    patron_2 = Patron.new("Sally", 20)
    patron_2.add_interest("IMAX")

    expect(dnms.recommend_exhibit(patron_1)).to eq([gems_and_minerals, dead_sea_scrolls])
    expect(dnms.recommend_exhibit(patron_2)).to eq([imax])
  end
end
