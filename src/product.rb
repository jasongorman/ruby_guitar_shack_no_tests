class Product
  attr_reader :id, :description, :stock, :lead_time

  def initialize(attrs = {})
    @id = attrs["id"]
    @description = attrs["description"]
    @stock = attrs["stock"]
    @lead_time = attrs["leadTime"]
  end
end