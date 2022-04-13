require 'pry'
require './lib/exhibit'
require './lib/patron'

class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def admit(patron)
    @patrons << patron
  end

  def recommend_exhibits(patron)
    rec = []
    @exhibits.each do |e|
      rec << e if patron.interests.include?(e.name)
    end
    rec
  end

  def patrons_by_exhibit_interest
    pbei = {
      gems_and_minerals: [],
      dead_sea_scrolls: [],
      imax: []
    }
    @patrons.each do |e|
      e.interests.each do |interest|
        pbei[:gems_and_minerals] << e if interest.include?("Gems and Minerals")
        pbei[:dead_sea_scrolls] << e if interest.include?("Dead Sea Scrolls")
        pbei[:imax] << e if interest.include?("IMAX")
        # binding.pry
      end
      # binding.pry
    end
    pbei
  end

  def ticket_lottery_contestants(exhibit)
    contestants = []
    @patrons.each do |e|
      # binding.pry
      contestants << e if e.spending_money < exhibit.cost
    end
    contestants
  end
end
