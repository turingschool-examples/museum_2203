require 'pry'
require './lib/patron'

class Exhibit
  attr_reader :name, :cost

  def initialize(info)
    @name = info[:name]
    @cost = info[:cost]
  end
end
