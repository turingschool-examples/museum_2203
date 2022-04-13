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
    recommendations = []
    @exhibits.each do |exhibit|
      recommendations << exhibit if patron.interests.include?(exhibit.name)
    end
    recommendations
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    exh_with_int_patrons = {}
    @exhibits.each do |exhibit|
      interested_patrons = []
      @patrons.each do |patron|
        interested_patrons << patron if patron.interests.include?(exhibit.name)
      end
      exh_with_int_patrons[exhibit] = interested_patrons
    end
    exh_with_int_patrons
  end

  def ticket_lottery_contestants(exhibit)
    eligible_contestants = []
    @patrons.each do |patron|
      eligible_contestants << patron if
      patron.interests.include?(exhibit.name) && patron.spending_money < exhibit.cost
    end
    eligible_contestants
  end

  def draw_lottery_winner(exhibit)
    if ticket_lottery_contestants(exhibit) == []
      nil
    else
      ticket_lottery_contestants(exhibit).sample.name
    end
  end
end
