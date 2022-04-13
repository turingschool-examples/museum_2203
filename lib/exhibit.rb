class Exhibit
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @cost = attributes.fetch(:cost)
  end
end
