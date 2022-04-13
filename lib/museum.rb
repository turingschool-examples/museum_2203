class Museum

  attr_reader :name, :exhibits, :patrons, :patrons_of_exhibts

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @patrons_of_exhibts = {}
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def admit(patron)
    @patrons << patron
    affordable_exhibit_costs = []
    affordable_exhibits = []
    recommended_exhibits(patron).each do |exhibit|
      affordable_exhibits << exhibit
      affordable_exhibit_costs << exhibit.cost
    end
    affordable_exhibit_costs.sort.reverse.each do |cost|
      if cost > patron.spending_money
        #do nothing
      else
        patron.charge_patron(cost)
        affordable_exhibits.each do |exhibit|
          @patrons_of_exhibts[exhibit] = []
        end
        affordable_exhibits.each do |exhibit|
          @patrons_of_exhibts[exhibit] << patron
        end
      end
    end
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
    return lottery_contestants
  end

  def draw_lottery_winner(exhibit)
    array = ticket_lottery_contestants(exhibit)
    if array[0] == nil
      return nil
    else
      array.sample.name
    end
  end

end
