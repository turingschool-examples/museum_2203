require "pry"
require "rspec"
require "./lib/exhibit"
require "./lib/patron"
require "./lib/museum"

RSpec.describe Patron do
  let(:patron_1) { Patron.new("Bob", 20) }

  it "exists" do
    expect(patron_1).to be_a Patron
  end

  it "has attributes" do
    expect(patron_1.name).to eq("Bob")
    expect(patron_1.spending_money).to eq 20
    expect(patron_1.interests).to eq([])
  end

  it "can add interests" do
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")

    expect(patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
  end
end
