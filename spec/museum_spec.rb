require './lib/patron'
require './lib/exhibit'
require './lib/museum'

describe Museum do
  let(:dmns){Museum.new("Denver Museum of Nature and Science")}

  it 'exists' do
    expect(dmns).to be_a(Museum)
  end
end
