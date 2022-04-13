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
    @exhibits.map do |exhibit|
      exhibit if patron.interests.include?(exhibit.name)
    end.compact
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    pbei = Hash.new
    @exhibits.each do |exhibit|
      pbei[exhibit] = []
    end
    pbei.each do |exhibit, patron_arr|
      @patrons.each do |patron|
        patron_arr << patron if patron.interests.include?(exhibit.name)
      end.compact
    end
    pbei
  end
end
