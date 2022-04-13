require 'rspec'
require './lib/exhibit'
require './lib/patron'
require 'pry'

describe Patron do
  before :each do
    @patron_1 = Patron.new("Bob", 20)
  end


  it 'exists' do
    expect(@patron_1).to be_a(Patron)
  end
end
