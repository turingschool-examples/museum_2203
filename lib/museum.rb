class Museum
  attr_reader :name, :exhibits, :patrons, :revenue, :patrons_of_exhibits

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @revenue = 0
    @patrons_of_exhibits = {}
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.select { |exhibit| patron.interests.include?(exhibit.name) }
  end

  def admit(patron)
    @patrons << patron
    recommend_exhibits(patron).sort_by { |exhibit| exhibit.cost }.reverse.each do |exhibit|
      next unless patron.spending_money >= exhibit.cost

      @revenue += exhibit.cost
      patron.charge(exhibit.cost)
      if @patrons_of_exhibits[exhibit].nil?
        @patrons_of_exhibits[exhibit] = [patron]
      else
        @patrons_of_exhibits[exhibit] << patron
      end
    end
  end

  def patrons_by_exhibit_interest
    exhibit_intests = {}
    @exhibits.each do |exhibit|
      if exhibit_intests[exhibit].nil?
        exhibit_intests[exhibit] = @patrons.select { |patron| patron.interests.include?(exhibit.name) }
      end
    end
    exhibit_intests
  end

  def ticket_lottery_contestants(exhibit)
    patrons_by_exhibit_interest[exhibit].select { |patron| patron.spending_money < exhibit.cost }
  end

  def draw_lottery_winner(exhibit)
    if ticket_lottery_contestants(exhibit) == []
      nil
    else
      ticket_lottery_contestants(exhibit).sample.name
    end
  end
end
