require 'pry'
require './lib/exhibit'
require './lib/patron'

class Museum
  attr_reader :name
  def initialize(name)
    @name = name
  end
end
