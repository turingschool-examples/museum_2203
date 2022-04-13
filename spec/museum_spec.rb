require './lib/museum'
require './lib/patron'
require './lib/exhibit'


RSpec.describe Museum do
  it 'exist' do
    dmns = Museum.new("Denver Museum of Nature and Science")
  expect(dmns).to be_an_instance_of(Museum)
  end

  it 'has readable attributes' do
    dmns = Museum.new("Denver Museum of Nature and Science")
  expect(dmns.name).to eq("Denver Museum of Nature and Science")
  expect(dmns.exhibits).to eq([])
  end


end
