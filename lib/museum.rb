class Museum
attr_reader :name, :exhibits, :patrons, :patron_preferences

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @patron_preferences = {}
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibit(patron)
    @exhibits.find_all do |exhibit|
      if patron.interests.include?(exhibit.name)
        exhibit
      end
    end
    # require 'pry'; binding.pry
  end

  def admit(patron)
    @patrons << patron
  end

  def patron_interest(exhibit)
    @patrons.find_all do |patron|
      patron.interests.include?(exhibit)
    end
  end

  def patrons_by_exhibit_interest
    # require 'pry'; binding.pry
    @exhibits.each do |exhibit|
      @patron_preferences[exhibit] = patron.interests.include?(exhibit)
    end
  end
end
