require './lib/exhibit'
require './lib/patron'

RSpec.describe Patron do
  it "exists" do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1).to be_a(Patron)
  end

  it "has attributes" do
    patron_1 = Patron.new("Bob", 20)

    expect(patron.name).to eq("Bob")
    expect(patron.spending_money).to eq(20)
  end





end
