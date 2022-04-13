require './lib/exhibit.rb'
require './lib/patron.rb'
require 'rspec'
require 'pry'

RSpec.describe Exhibit do
  it "exists" do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    expect(exhibit).to be_an_instance_of(Exhibit)
  end

  it "gives each exhibit a name and cost" do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    # binding.pry
    expect(exhibit.cost).to eq 0
    expect(exhibit.name).to eq "Gems and Minerals"
  end
end
