require './lib/patron'
require './lib/exhibit'

RSpec.describe Patron do
  it 'exist' do
    patron_1 = Patron.new("Bob", 20)
  expect(patron_1).to be_an_instance_of(Patron)
  end



end
