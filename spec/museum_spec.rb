require 'rspec'
require './lib/museum'

describe Museum do

  before(:each) do
    @dmns = Museum.new("Denver Museum of Nature and Science")
  end

  it 'exists' do
    expect(@dmns).to be_a(Museum)
  end

  it 'had readable attributes' do
    expect(@dmns.name).to eq("Denver Museum of Nature and Science")
    expect(@dmns.exhibits).to eq([])
  end
end
