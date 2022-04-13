require './lib/museum'
require './lib/patron'
require './lib/exhibit'

RSpec.describe Museum do
  describe 'iteration II' do
    it 'exisits and has attributes' do
      dmns = Museum.new("Denver Museum of Nature and Science")

      expect(dmns).to be_a Museum
      expect(dmns.name).to eq "Denver Museum of Nature and Science"
      expect(dmns.exhibits).to eq []
    end

    it 'not sure yet' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)

    expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])
    end
  end
end
