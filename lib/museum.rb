class Museum
  attr_reader :name, :exhibits
  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommended_exhbits(patron)
    museum_recommended_exhbits = []
    @exhibits.each do |exhibit|
      if patron.interests.include?(exhibit.name)
        museum_recommended_exhbits << exhibit.name # if !museum_recommended_exhbits.include?(exhibit)
      end
    end
  return museum_recommended_exhbits
  end
end
