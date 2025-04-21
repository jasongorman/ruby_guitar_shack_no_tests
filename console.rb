require_relative 'src/alert'
require_relative 'src/stock_monitor'
require_relative 'src/warehouse'
require_relative 'src/restock_level'
require_relative 'src/sales_history'

class AlertMock < Alert
  def send(message)
    puts message
  end
end

sales_history_base_url = "https://gjtvhjg8e9.execute-api.us-east-2.amazonaws.com/default/sales"
warehouse_base_url = "https://6hr1390c1j.execute-api.us-east-2.amazonaws.com/default/product"

stock_monitor = StockMonitor.new(AlertMock.new,
                                 Warehouse.new(warehouse_base_url),
                                 RestockLevel.new(SalesHistory.new(sales_history_base_url)))

# Test cases
# Alert should be triggered:
# product_id = 811, quantity = 50
# Alert should not be triggered:
# product_id = 811, quantity = 1

product_id = ARGV[0].to_i
quantity = ARGV[1].to_i

stock_monitor.on_sale(product_id, quantity)

