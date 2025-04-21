class RestockLevel
  def initialize(sales_history)
    @sales_history = sales_history
  end

  def calculate(product)
    total_sales = @sales_history.total_for_period(product.id, Date.today - 30, Date.today)
    average_daily_sales = total_sales/30
    (average_daily_sales * product.lead_time).ceil
  end
end