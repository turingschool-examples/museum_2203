class Museum

  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(interest)
    @exhibits << interest
  end

  def recommend_exhibits(patron)
    patron.interests
  end

  def admit(patrons)
    @patrons << patrons
  end

end
