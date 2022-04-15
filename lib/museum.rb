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

  def reccommend_exhibits(patron)
    patron_reccommend = []
    patron.interests.each do |interest|
      patron_reccommend << interest
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    patron_exhibit_interest = {}
      @exhibits.map do |exhibit|
        patron_exhibit_interest[exhibit] =
          @patrons.select do |patron|
            patron.interests.include?(exhibit.name)
          end
      end
      patron_exhibit_interest
  end


  def ticket_lottery_contestants(exhibit)
    patrons_by_exhibit_interest[exhibit].select do |patron|
      patron.spending_money < exhibit.cost
    end
  end

  def draw_lottery_winner(exhibit)
    ticket_lottery_contestants(exhibit).sample.name
  end

end
