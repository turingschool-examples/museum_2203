require './lib/exhibit'
require './lib/patron'
require './lib/museum'
require 'pry'

RSpec.describe Patron do

  it "exists" do

    patron = Patron.new("name", 3)

    expect(patron).to be_a(Patron)
  end

  it "has a name and spending money" do

      patron_1 = Patron.new("Bob", 20)

      expect(patron_1.name).to eq("Bob")
      expect(patron_1.spending_money).to eq(20)
  end

  it "has interests" do

    patron_1 = Patron.new("Bob", 20)

    expect(patron_1.interests).to eq([])

    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")

    expect(patron_1.interests).to eq(["Dead Sea Scrolls","Gems and Minerals"])

  end

  it "has a new patron w/ interests" do

    patron_2 = Patron.new("Sally", 20)

    expect(patron_2.interests).to eq([])

    patron_2.add_interest("IMAX")

  end

  xit "can recommend exhibits" do

    patron_1 = Patron.new("Bob", 20)
    patron_2 = Patron.new("Sally", 20)

    expect(patron_1.interests).to eq([])
    expect(patron_2.interests).to eq([])

    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    patron_2.add_interest("IMAX")

    expect(patron_1.interests).to eq(["Dead Sea Scrolls","Gems and Minerals"])
    expect(patron_2.interests).to eq(["IMAX"])

    dmns = Museum.new("Denver Museum of Nature and Science")

    dmns.recommend_exhibits(patron_1)
    dmns.recommend_exhibits(patron_2)

    expect(dmns.recommend_exhibits(patron_1)).to eq(patron_1.interests)
    expect(dmns.recommend_exhibits(patron_2)).to eq(patron_2.interests)

  end

end
