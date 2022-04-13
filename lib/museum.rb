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
    # binding.pry
    # @patrons.each do |patron|
      patron.interests
    # end
  end

  def admit(patron)
    @patrons << patron
  end
end
