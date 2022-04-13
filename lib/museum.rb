
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

  def patrons_by_exhibit_interest
    patrons_by_interest_hash = {}
    @exhibits.each do |exhibit|
      patrons_by_interest_hash[exhibit] = []
      patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          patrons_by_interest_hash[exhibit] << patron
        end
      end
    end
    return patrons_by_interest_hash
  end

end
