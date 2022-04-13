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
    patron_recommendations = []
    @exhibits.each do |exhibit|
        patron_recommendations << exhibit if patron.interests.include?(exhibit.name)
    end
    patron_recommendations
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    patron_hash = {}
    @exhibits.each do |exhibit|
      patron_hash[exhibit] = []
      @patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          patron_hash[exhibit] << patron
        end
      end
    end
        patron_hash
  end

  def ticket_lottery_contestants(exhibit)
    patron_array = []
    patrons_by_exhibit_interest[exhibit].each do |patron|
      patron_array << patron if exhibit.cost > patron.spending_money
    end
    patron_array
  end

  def draw_lottery_winner(exhibit)
    ticket_lottery_contestants(exhibit).sample
  end

end
