
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

  def recommended_exhibits(patron)
    @exhibits.map do |exhibit|
      if patron.interests.include?(exhibit.name)
        exhibit
      end
    end.compact
  end

end
