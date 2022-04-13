
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
    recmd_exhib = []
    @exhibits.each do |exhibit|
      if patron.interests.include?(exhibit.name)
        recmd_exhib << exhibit
      end
    end
    return recmd_exhib
  end

  def admit(patron)
    @patrons << patron
  end
  
end
