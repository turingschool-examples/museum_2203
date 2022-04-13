
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

  def recommended_exhibits(patron)
    @exhibits.map do |exhibit|
      if patron.interests.include?(exhibit.name)
        exhibit
      end
    end.compact
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_interests(exhibit)
    @patrons.find_all do |patron|
      patron.interests.include?(exhibit.name)
    end
  end

  def patrons_by_exhibit_interest
    @exhibits.reduce({}) do |hash, exhibit|
      hash[exhibit] = patrons_by_interests(exhibit)
      hash
    end
  end

  def ticket_lottery_contestants(exhibit)
    @patrons.find_all do |patron|
      patron.spending_money < exhibit.cost
    end
  end

  def draw_lottery_winner(exhibit)
    winner = ticket_lottery_contestants(exhibit).sample
    winner.name
  end
end
