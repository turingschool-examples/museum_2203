require './lib/exhibit'
require './lib/patron'
require 'rspec'

RSpec.describe Exhibit do
  let (:exhibit) { Exhibit.new({name: "Gems and Minerals", cost: 0}) }
  let (:patron_1) { Patron.new("Bob", 20) }


  it 'exisits' do
    expect(exhibit).to be_a(Exhibit)
  end

  it 'has attributes' do
    expected = {name: "Gems and Minerals", cost: 0}
    expect(exhibit.name).to eq(expected)
  end

end
