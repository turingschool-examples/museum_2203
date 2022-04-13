require 'pry'
class Museum

  attr_reader :name, :exhibits, :patrons 
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit_name)
    @exhibits << exhibit_name
  end

  def recommend_exhibits(patron)
    @exhibits.map do |exhibit|
      exhibit.name
    end
  end
end
