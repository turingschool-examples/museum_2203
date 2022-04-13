require './lib/patron'
require './lib/exhibit'
require 'pry'

class Museum
  attr_reader :name, :exhibits
  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(new_exhibit)
    @exhibits << new_exhibit
  end

  def recommend_exhibit(patron)
    @exhibits.select { |exhibit| exhibit if patron.interests.include?(exhibit.name)}
  end
end
