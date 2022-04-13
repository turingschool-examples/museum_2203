require './lib/patron'
require './lib/exhibit'
require './lib/museum'

describe Museum do
  let(:dmns){Museum.new("Denver Museum of Nature and Science")}

  it 'exists' do
    expect(dmns).to be_a(Museum)
  end

  it 'has readable attributes' do
    expect(dmns.name).to eq("Denver Museum of Nature and Science")
    expect(dmns.exhibits).to eq([])
  end
end
