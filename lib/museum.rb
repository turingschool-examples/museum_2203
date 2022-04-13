require './lib/patron'
require './lib/exhibit'
require 'pry'

class Museum
  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(new_exhibit)
    @exhibits << new_exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.select { |exhibit| exhibit if patron.interests.include?(exhibit.name)}
  end
  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    @pbei_hash = {}
    @exhibits.each do |exhibit|
      @pbei_hash[exhibit] = []
      @patrons.each do |patron|
        @pbei_hash[exhibit] << patron if recommend_exhibits(patron).include?(exhibit)
        end
      end
    return @pbei_hash
  end

end
