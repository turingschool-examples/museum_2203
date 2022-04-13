require './lib/patron'

class Exhibit
  attr_reader :ex_name, :ex_cost, :patrons
  def initialize (ex_name, ex_cost)
    @ex_name = ex_name
    @ex_cost = ex_cost
    @patrons = []
  end

  def name
    @ex_name.fetch(:name)
  end

  def cost
    @ex_cost.fetch(:cost)
  end

  def add_patron(patron)
    patrons << patron
  end


end
