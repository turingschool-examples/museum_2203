# exhibit_spec.rb

require 'pry'
require 'rspec'
require './lib/exhibit'

describe 'exhibit' do
  it 'exists' do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})

    expect(exhibit).to be_an_instance_of Exhibit
  end
end
