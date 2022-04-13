require 'rspec'
require 'pry'
require './lib/exhibit'
describe Exhibit do
  context 'iteration 1' do
    before(:each) do
      @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    end
    it 'exists' do
      expect(@exhibit).to be_an_instance_of(Exhibit)
    end
    it 'has a readable name' do
      expect(@exhibit.name).to eq("Gems and Minerals")
    end
    it 'has an associated cost' do
      expect(@exhibit.cost).to eq(0)
    end
  end
end
