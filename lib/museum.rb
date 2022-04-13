class Museum
  attr_reader :name,
              :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    # require "pry";binding.pry
    recommended = []
    @exhibits.each do |exhibit|
          patron.interests.include?(exhibit.name)
          recommended << exhibit
      recommended
    end
  end
end
