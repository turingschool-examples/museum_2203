# museum_spec.rb
require 'pry'
require 'rspec'
require './lib/exhibit'
require './lib/patron'
require './lib/museum'

describe 'Museum' do
  it 'exists' do
    dmns = Museum.new("Denver Museum of Nature and Science")

    expect(dmns).to be_an_instance_of Museum
  end
end
