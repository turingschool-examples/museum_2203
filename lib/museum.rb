# require './lib/exhibit'
# require './lib/patron'

class Museum
  attr_reader :name, :exhibits, :recommend_exhibits
  def initialize(name)
    @name = name
    @exhibits = []
    @recommend_exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.each do |exhibit|
      require 'pry', binding.pry
      patron.interests.include?(exhibit.name)
        @recommend_exhibits << exhibit
    end
  end

end
