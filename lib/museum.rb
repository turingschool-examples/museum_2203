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

end
