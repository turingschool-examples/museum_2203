require './lib/museum'
require './lib/exhibit'
require './lib/patron'

describe Museum do
  it 'exists' do
    dmns = Museum.new("Denver Museum of Nature and Science")

    expect(dmns).to be_a(Museum)
  end
end
