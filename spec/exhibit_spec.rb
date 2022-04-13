require './lib/exhibit'
require './lib/patron'
RSpec.describe Exhibit do

  it 'exists' do
    exhibit1 = Exhibit.new({name: "Gems and Minerals", cost: 0})
    expect(exhibit1).to be_a(Exhibit)
  end

  it 'has attributes' do
    exhibit1 = Exhibit.new({name: "Gems and Minerals", cost: 0})
    expect(exhibit1.name).to eq("Gems and Minerals")
    expect(exhibit1.cost).to eq(0)

  end




end
