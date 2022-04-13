class Museum

  attr_reader :name, :exhibits, :patrons, :patrons_of_exhibits, :revenue

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @patrons_of_exhibits = {}
    @revenue = 0
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def admit(patron)
    @patrons << patron
    affordable_exhibits = []
    recommended_exhibits(patron).each do |exhibit|
      affordable_exhibits << exhibit
    end

    ordered_exhibits = affordable_exhibits.sort_by{ |exhibit| exhibit.cost}.reverse

    ordered_exhibits.each do |exhibit|
      if @patrons_of_exhibits[exhibit].nil?
        @patrons_of_exhibits[exhibit] = []
      end
    end

    ordered_exhibits.each do |exhibit|
      if exhibit.cost > patron.spending_money
        #do nothing
      else
        patron.charge_patron(exhibit.cost)
        @patrons_of_exhibits[exhibit] << patron
        @revenue += exhibit.cost
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
