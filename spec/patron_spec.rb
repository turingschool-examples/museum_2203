# patron_spec.rb
require 'pry'
require 'rspec'
require './lib/exhibit'
require './lib/patron'

describe 'patron' do
  it 'exists' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1).to be_an_instance_of Patron
  end

  it 'has a name and spending money' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1.name).to eq "Bob"
    expect(patron_1.spending_money).to eq 20
  end

  it 'has no interests initially' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1.interests).to eq []
  end

  it 'can have interests added to it' do
    patron_1 = Patron.new("Bob", 20)
    patron_1.add_interests("Dead Sea Scrolls")
    patron_1.add_interests("Gems and Minerals")

    expect(patron_1.interests).to eq ["Dead Sea Scrolls", "Gems and Minerals"]
  end
end
