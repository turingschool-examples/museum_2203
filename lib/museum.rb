require './lib/patron'
require './lib/exhibit'

class Museum

  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recommended_exhibits = []
    @exhibits.each do |exhibit|
      if patron.interests.include?(exhibit.name)
        recommended_exhibits << exhibit
      end
    end
    recommended_exhibits
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    interested_exhibits = {}
    @exhibits.each do |exhibit|
      interested_exhibits[exhibit] = []
    end
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          interested_exhibits[exhibit] << patron
        end
      end
    end
    interested_exhibits
  end
end
