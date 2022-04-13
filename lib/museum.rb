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

  def admit(patron)
    @patrons << patron
  end

  def recommended_exhibits(patron)
    recommended = []
    exhibits.each do |exhibit|
      patron.interests.each do |interest|
        # require 'pry'; binding.pry
        if interest == exhibit.name
          recommended << exhibit
        end
      end
    end
    return recommended
  end

  def patrons_by_exhibit_interest
    hash = {}
    @exhibits.each do |exhibit|
      hash[exhibit] = []
    end
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          hash[exhibit] << patron
        end
      end
    end
    return hash


  end

end
