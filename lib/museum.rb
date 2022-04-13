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
end
