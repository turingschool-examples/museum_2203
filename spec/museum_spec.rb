require './lib/patron'
require './lib/exhibit'
require './lib/museum'

describe Museum do
  let(:dmns){Museum.new("Denver Museum of Nature and Science")}
  let(:gems_and_minerals){Exhibit.new({name: "Gems and Minerals", cost: 0})}
  let(:dead_sea_scrolls){Exhibit.new({name: "Dead Sea Scrolls", cost: 10})}
  let(:imax){Exhibit.new({name: "IMAX",cost: 15})}
  let(:patron_1){Patron.new("Bob", 0)}
  let(:patron_2){Patron.new("Sally", 20)}
  let(:patron_3){Patron.new("Johnny", 5)}


  it 'exists' do
    expect(dmns).to be_a(Museum)
  end

  it 'has readable attributes' do
    expect(dmns.name).to eq("Denver Museum of Nature and Science")
    expect(dmns.exhibits).to eq([])
  end

  it "can add exhibits" do
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])
  end

  it "can recommend exhibits" do
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(imax)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    patron_2.add_interest("IMAX")
    expect(dmns.recommend_exhibits(patron_1)).to eq([dead_sea_scrolls, gems_and_minerals])
    expect(dmns.recommend_exhibits(patron_2)).to eq([imax])
  end

  it "can admit patrons" do
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    patron_1.add_interest("Gems and Minerals")
    patron_1.add_interest("Dead Sea Scrolls")
    patron_2.add_interest("IMAX")
    patron_3.add_interest("Dead Sea Scrolls")
    expect(dmns.patrons).to eq([])
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)
    expect(dmns.patrons).to eq([patron_1, patron_2, patron_3])
  end

  it "can return patrons by interest" do
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    patron_1.add_interest("Gems and Minerals")
    patron_1.add_interest("Dead Sea Scrolls")
    patron_2.add_interest("Dead Sea Scrolls")
    patron_3.add_interest("Dead Sea Scrolls")
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)
    expect(dmns.patrons_by_exhibit_interest).to eq(gems_and_minerals => [patron_1],
    dead_sea_scrolls => [patron_1, patron_2, patron_3],
    imax => [])
  end

  it "can determine lotter contestants and pull a winner" do
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    patron_1.add_interest("Gems and Minerals")
    patron_1.add_interest("Dead Sea Scrolls")
    patron_2.add_interest("Dead Sea Scrolls")
    patron_3.add_interest("Dead Sea Scrolls")
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)
    expect(dmns.ticket_lottery_contestants(dead_sea_scrolls)).to eq([patron_1, patron_3])
    expect(dmns.draw_lottery_winner(dead_sea_scrolls)).to eq("Johnny" || "Bob")
    expect(dmns.draw_lottery_winner(gems_and_minerals)).to eq(nil)
  end
end
