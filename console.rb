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

stock_monitor = StockMonitor.new(AlertMock.new,
                                 Warehouse.new,
                                 RestockLevel.new(SalesHistory.new))

# Test cases
# Alert should be triggered:
# product_id = 811, quantity = 50
# Alert should not be triggered:
# product_id = 811, quantity = 1

product_id = ARGV[0].to_i
quantity = ARGV[1].to_i

stock_monitor.on_sale(product_id, quantity)

