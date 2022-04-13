class Exhibit
  attr_reader :name, :cost
  
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @cost = attributes.fetch(:cost)
  end
end
