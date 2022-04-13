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

  def recommend_exhibits(patron)
    @exhibits.select { |exhibit| patron.interests.include?(exhibit.name) }
  end

  def admit(patron)
    @patrons << patron
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
    ticket_lottery_contestants(exhibit).sample.name
  end
end
