class Patron
  attr_reader :name, :speanding_money

  def initialize(name, spending_money)
    @name = name
    @spending_money = spending_money
  end

end
