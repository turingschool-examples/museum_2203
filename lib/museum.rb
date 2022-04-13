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
end
