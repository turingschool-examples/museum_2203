require './lib/exhibit'
require './lib/museum'



RSpec.describe Patron do


  it 'exists' do
    patron_1 = Patron.new("Bob", 20)
    expect(patron_1).to be(Patron)
  end

  it 'has readable attributes' do
    patron_1 = Patron.new("Bob", 20)
    expect(patron_1.name).to eq("Bob")
    expect(patron_1.spending_money).to eq(20)
    expect(patron_1.interests).to eq([])

  end

end
