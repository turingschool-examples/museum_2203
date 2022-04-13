class Museum

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def name
    @name
  end

  def exhibits
    @exhibits
  end

  def patrons
    @patrons
  end

  def admin(patron)
    @patrons << patron
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    rec_list = []
    patron.interests.each do |interest|
      @exhibits.each do |exhibit|
        # interests.each
        if exhibit.name == interest
      # require 'pry'; binding.pry
        rec_list << exhibit
      end
    end
    rec_list
  end

  def patrons_by_exhibit_interest
    new_hash = {}
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        patron.interests.each do |interest|
          if exhibit == interest
            new_hash[exhibit] = patron
        end
      end
    end
    new_hash
  end

end
