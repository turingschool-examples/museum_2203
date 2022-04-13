class Exhibit
  attr_reader :exhibit_hash

  def initialize(exhibit_hash)
    @exhibit_hash = exhibit_hash
  end

  def name
    @exhibit_hash[:name]
  end

  def cost
    @exhibit_hash[:cost]
  end

end
