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
    recommendations = []
    @exhibits.each do |exhibit|
      recommendations << exhibit if patron.interests.include?(exhibit.name)
    end
    recommendations
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    exh_with_int_patrons = {}
    @exhibits.each do |exhibit|
      interested_patrons = []
      @patrons.each do |patron|
        interested_patrons << patron if patron.interests.include?(exhibit.name)
      end
      exh_with_int_patrons[exhibit] = interested_patrons
    end
    exh_with_int_patrons
  end
end
