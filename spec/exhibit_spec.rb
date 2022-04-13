require 'rspec'
require './lib/exhibit'

describe Exhibit do
  it "exists" do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    expect(exhibit).to be_an_instance_of(Exhibit)
  end

  it "gets name" do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    expect(exhibit.name).to eq("Gems and Minerals")
  end

  it "gets cost" do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    expect(exhibit.cost).to eq(0)
  end

end
