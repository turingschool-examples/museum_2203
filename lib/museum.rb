class Museum

  attr_reader :name, :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
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

end
