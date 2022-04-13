# patron_spec.rb
require 'pry'
require 'rspec'
require './lib/exhibit'
require './lib/patron'

describe 'patron' do
  it 'exists' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1).to be_an_instance_of Patron
  end
end
