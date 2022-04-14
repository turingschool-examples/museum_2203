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
    @exhibits.map do |exhibit|
      exhibit if patron.interests.include?(exhibit.name)
    end.compact
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    exhibits_by_price = @exhibits.sort_by do |exhibit|
      exhibit.cost
    end.reverse
    pbei = Hash.new
    exhibits_by_price.each do |exhibit|
      pbei[exhibit] = []
    end
    pbei.each do |exhibit, patron_arr|
      @patrons.each do |patron|
        patron_arr << patron if patron.interests.include?(exhibit.name)
      end.compact
    end
    pbei
  end

  def ticket_lottery_contestants(exhibit)
    patrons_by_exhibit_interest[exhibit].find_all do |patron|
      patron.spending_money < exhibit.cost
    end
  end

  def draw_lottery_winner(exhibit)
    if ticket_lottery_contestants(exhibit).sample == nil
      nil
    else
      ticket_lottery_contestants(exhibit).sample.name
    end
  end
end
