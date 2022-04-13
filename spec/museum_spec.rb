require 'rspec'
require './lib/exhibit'
require './lib/patron'
require './lib/museum'
require 'pry'

describe Museum do
  before :each do
    @dmns = Museum.new("Denver Museum of Nature and Science")
  end

  it 'exists' do
    expect(@dmns).to be_a(Museum)
  end

  it 'has a name' do
    expect(@dmns.name).to eq("Denver Museum of Nature and Science")
  end

end
