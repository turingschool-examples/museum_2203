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
    @exhibits.select do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    patrons_by_exhibit = {}
    @exhibits.each do |exhibit|
      if !patrons_by_exhibit.has_key?(exhibit)
        patrons_by_exhibit[exhibit] =
        @patrons.select do |patron|
          patron.interests.include?(exhibit.name)
        end
      end
    end
    patrons_by_exhibit
  end

  def ticket_lottery_contestants(exhibit)
    ## I need to look at all patrons interested in that exibit and check how much money they have
    patrons_by_exhibit_interest[exhibit].select do |patron|
      patron.spending_money < exhibit.cost
    end
  end

  def draw_lottery_winner(exhibit)
    # require "pry"; binding.pry
    if ticket_lottery_contestants(exhibit) == []
      nil
    else
    ticket_lottery_contestants(exhibit).sample.name
    end
  end

  

end
