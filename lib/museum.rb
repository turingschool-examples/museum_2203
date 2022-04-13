class Museum
attr_reader :name, :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
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
end

      # if exhibit.name.include?(patron.interests)
      #   @recommendations << exhibit
      # @recommendations
      # end
