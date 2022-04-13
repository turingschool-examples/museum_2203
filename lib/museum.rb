require 'pry'
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
    recommended_exhibits = []
    patron.interests.each do |interest|
      @exhibits.each do |exhibit|
      recommended_exhibits << exhibit if exhibit.exhibit_hash[:name] == interest
      end
    end
    recommended_exhibits
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    interest_hash = {}
    @exhibits.each do |exhibit|
      interest_array = []
      @patrons.each do |patron|
        interest_array << patron if patron.interests.include?(exhibit.name)
        interest_hash[exhibit] = interest_array
      end
    end
    interest_hash
  end

  def ticket_lottery_contestants(exhibit)
    interst_list = patrons_by_exhibit_interest
    interst_list[exhibit]
  end

  def draw_lottery_winner(exhibit)
    ticket_list = ticket_lottery_contestants(exhibit)
    random_draw_number = rand(ticket_list.length -1)
    ticket_list[random_draw_number]
  end
end
