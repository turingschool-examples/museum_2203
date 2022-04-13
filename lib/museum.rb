class Museum
  attr_reader :name,
              :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(category)
    @exhibits << category
  end

  def recommend_exhibits(patron)
    interests = patron.interests
    recommended = []
    interests.each do |interest|
       @exhibits.each do |exhibit|
        if exhibit.name == interest
          recommended << exhibit
        end
      end
    end
  end
end
