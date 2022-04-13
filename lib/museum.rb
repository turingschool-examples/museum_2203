class Museum
  attr_reader :name,
  :exhibits
  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(added_exhibits)
    @exhibits << added_exhibits
  end

  def recommend_exhibits(recommend)
    recommend = []
    @interests << recommend    
  end
end
