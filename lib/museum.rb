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

  def recommended_exhibits(patron)
    recommended = []
    exhibits.each do |exhibit|
      patron.interests.each do |interest|
        # require 'pry'; binding.pry
        if interest == exhibit.name
          recommended << exhibit
        end
      end
    end
    return recommended
  end

  def patrons_by_exhibit_interest
    hash = {}
    @exhibits.each do |exhibit|
      hash[exhibit] = []
    end
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          hash[exhibit] << patron
        end
      end
    end
    return hash
  end

  def ticket_lottery_contestants(exhibit)
    cost = exhibit.cost
    hash = patrons_by_exhibit_interest
    lottery_contestants = []

    hash[exhibit].each do |patron|
      if cost > patron.spending_money
        lottery_contestants << patron
      end
    end
    require 'pry'; binding.pry
    return lottery_contestants
  end

end
