require 'rspec'
require './lib/exhibit'

describe Exhibit do
  it 'exists with attributes' do
    exhibit = Exhibit.new({ name: 'Gems and Minerals', cost: 0 })
    expect(exhibit).to be_a(Exhibit)
    expect(exhibit.name).to eq('Gems and Minerals')
    expect(exhibit.cost).to eq(0)
  end
end
