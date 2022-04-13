require 'pry'
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
      # binding.pry
       @exhibits.each do |exhibit|
        if exhibit.name == interest
          recommended << exhibit #why is this returning a string? RIP 45 minutes
        end
      end
    end
    recommended
  end
end
