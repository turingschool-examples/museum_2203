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

  end



end
