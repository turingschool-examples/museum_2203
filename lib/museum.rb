require 'pry'
require './lib/exhibit'
require './lib/patron'

class Museum
  attr_reader :name, :exhibits
  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    rec = []
    @exhibits.each do |e|
      rec << e if patron.interests.include?(e.name)
    end
    rec
  end
end
