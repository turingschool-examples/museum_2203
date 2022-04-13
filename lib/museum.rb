require './lib/exhibit'
require 'pry'
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

  def reccomend_exhibits(patron)
    fitting_exhibits = []
    @exhibits.each do |exhibit|
      fitting_exhibits << exhibit if patron.interests.include?(exhibit.name)
    end
    fitting_exhibits
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_interest(exhibit)
    @patrons.find_all do |patron|
      patron.interests.include?(exhibit.name)
    end
  end

  def patrons_by_exhibit_interest
    @exhibits.reduce({}) do |hash, exhibit|
      hash[exhibit] = patrons_by_interest(exhibit)
      hash
    end
  end

  def ticket_lottery_contestants(exhibit)
    check_eligible = patrons_by_interest(exhibit)
    participants = []
    check_eligible.each do |patron_dough|
      if exhibit.cost > patron_dough.spending_money
        participants << patron_dough
      end
    end
    participants
  end

  def draw_lottery_winner(exhibit)
    eligible = ticket_lottery_contestants(exhibit)
    # binding.pry
    if eligible.nil?
      return nil
    else
      winner = eligible.sample
      return winner.name
    end
  end
end
