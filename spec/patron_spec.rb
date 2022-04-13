require './lib/exhibit.rb'
require './lib/patron.rb'
require 'rspec'
require 'pry'

RSpec.describe Patron do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    patron_1 = Patron.new("Bob", 20)

  it "exists" do
    expect(patron_1).to be_an_instance_of(Patron)
    expect(exhibit).to be_an_instance_of(Exhibit)
  end

  it "gives each patron a name" do
    expect(patron_1.name).to eq "Bob"
  end

  it "gives each patron spending money" do
    expect(patron_1.spending_money).to eq 20
  end

  it "sets interests to a empty array by default" do
    expect(patron_1.interests).to eq []
  end

  it "can add interests to each patron" do
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    expect(patron_1.interests).to eq ["Dead Sea Scrolls", "Gems and Minerals"]
  end
end
