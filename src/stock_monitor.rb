class StockMonitor
  def initialize(alert, warehouse, restock_level)
    @alert = alert
    @warehouse = warehouse
    @restock_level = restock_level
  end

  def on_sale(product_id, quantity)
    product = @warehouse.fetch_product(product_id)

    if product.stock - quantity <= @restock_level.calculate(product)
      @alert.send("Please order more of product #{product_id} - #{product.description}")
    end
  end
end
