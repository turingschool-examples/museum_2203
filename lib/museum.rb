class Museum

  attr_reader :name, :exhibits
  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(interest)
    @exhibits << interest
  end
end
