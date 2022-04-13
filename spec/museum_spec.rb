require 'rspec'
require './lib/patron'
require './lib/exhibit'
require './lib/museum'

describe Museum do
  it 'exists with attributes' do
    dmns = Museum.new('Denver Museum of Nature and Science')
    expect(dmns).to be_a(Museum)
    expect(dmns.name).to eq('Denver Museum of Nature and Science')
    expect(dmns.exhibits).to eq([])
  end
end
