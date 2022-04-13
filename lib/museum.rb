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
    @recommended = []
    @exhibits.each do |exhibit|
      if patron.interests.include?(exhibit.name)
        @recommended << exhibit
      end
    end
    @recommended
  end

  def admit(patron)
    @patrons << patron
  end

  # def patrons_by_exhibit_interest
  #
  # end

  def ticket_lottery_contestants(exhibit)
    @lotto_contestants = []
    @patrons.each do |patron|
      if (patron.interests.include?(exhibit.name)) && (patron.spending_money < exhibit.cost)
        @lotto_contestants << patron
      end
    end
    @lotto_contestants
  end

  def draw_lottery_winner(exhibit)
    ticket_lottery_contestants(exhibit)
    @lotto_contestants.shuffle!
    return @lotto_contestants[0]
  end
end
