require './lib/patron'
require './lib/exhibit'

RSpec.describe Patron do
  it 'exist' do
    patron_1 = Patron.new("Bob", 20)
  expect(patron_1).to be_an_instance_of(Patron)
  end

  it 'has readable attributes' do
    patron_1 = Patron.new("Bob", 20)
  expect(patron_1.name).to eq("Bob")
  expect(patron_1.spending_money).to eq(20)
  expect(patron_1.interest).to eq([])
  end

  it "can add patron interest to Array" do
    patron_1 = Patron.new("Bob", 20)

    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")

  expect(patron_1.interest).to eq(["Dead Sea Scrolls", "Gems and Minerals"])

  end



end
