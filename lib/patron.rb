class Patron
  attr_reader :name, :spending_money, :interest

  def initialize(name, spending_money)
    @name = name
    @spending_money = spending_money
    @interest = Array.new
  end


end
