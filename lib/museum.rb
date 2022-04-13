class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def recommend_exhibits(patron_interests)
    patron.interests
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    patron_hash = {}
      @patrons.each do |patron|
        patron_hash[patrons] = [] if patron_hash[patrons].nil?
        patron_hash[patrons] << patron
        end
      patron_hash[patrons]
  end

end
