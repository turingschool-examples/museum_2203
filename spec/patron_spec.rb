require './lib/patron'
RSpec.describe Patron do

  it 'exists' do
    patron_1 = Patron.new("Bob", 20)
    expect(patron_1).to be_a(Person)
  end

  it 'has attributes' do
    patron_1 = Patron.new("Bob", 20)
    expect(patron_1.name).to eq("Bob")
    expect(patron_1.spending_money).to eq(20)

  end



end
