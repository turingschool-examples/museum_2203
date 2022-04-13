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
    @recommended = []
    @exhibits.each do |exhibit|
      if patron.interests.include?(exhibit.name)
        @recommended << exhibit
      end
    end
    @recommended
  end

  def admit(patron)
    @patrons << patron
  end
end
