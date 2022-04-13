class Museum
  attr_reader :name,
              :exhibits
              
  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(category)
    @exhibits << category
  end
end
