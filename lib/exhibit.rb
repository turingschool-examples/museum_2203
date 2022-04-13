class Exhibit
  attr_reader :name,
    :cost

  def initialize(hash_attr)
    @name = hash_attr[:name]
    @cost = hash_attr[:cost]
  end
end
