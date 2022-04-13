class Patron
  attr_reader :name,
  :interests,
  :spending_money
  def initialize(name, spending_money)
    @name = name
    @interests = []
    @spending_money = 20
  end

  def add_interest(interest)
    @interests << interest
  end
end
