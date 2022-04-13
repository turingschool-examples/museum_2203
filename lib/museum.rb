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
    recommended_exhibits = []
    @exhibits.find_all do |exhibit|
      if patron.interests.include?(exhibit.name)
        recommended_exhibits << exhibit
      end
    end
  end

  def admit(patron)
      @patrons << patron
  end

  def patrons_by_exhibit_interest
    exhibit_interest = {}
    @patrons.each do |patron|
      if recommend_exhibits(patron) == @exhibits[0]
        exhibit_interest[@exhibits[0]] = [patron]
      elsif recommend_exhibits(patron) == @exhibits[1]
        exhibit_interest[@exhibits[1]] = [patron]
      elsif recommend_exhibits(patron) == @exhibits[2]
        exhibit_interest[@exhibits[2]] = [patron]
      else
        exhibit_interest[@exhibits[0]] = []
        exhibit_interest[@exhibits[1]] = []
        exhibit_interest[@exhibits[2]] = []
  
    end
    end
  end
end
