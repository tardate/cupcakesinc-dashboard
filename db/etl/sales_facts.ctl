
ETL::Engine.logger = Logger.new(STDOUT)
#ETL::Engine.logger.level = Logger::DEBUG

source :in, {
  :type => :database,
  :target => :cupcake_development,
  :database => 'cupcake_development',
  :table => 'order_items',
  :join => "join orders on order_items.order_id = orders.id",
  :select => "order_items.order_id, order_items.product_id, order_items.qty, order_items.unit_price, orders.customer_id, orders.order_date"

}, 
[ 
	:order_id, :product_id, :qty, :unit_price, :customer_id, :order_date
]

pre_process :truncate, :target => :development, :table => 'sales_facts'

after_read do |row| 
	row[:date_id] = 1
	row 
end
#before_write :surrogate_key, :target => :cupcake_development, :table => 'orders', :column => 'id'
before_write :copy_field, :destination => :sale_price, :source => :unit_price

destination :out, {
  :type => :database,
  :target => :development,
  :database => 'cupcake_dw_development',
  :table => 'sales_facts'
},
{
  :order => [ :date_id, :customer_id, :product_id, :qty, :sale_price ]
}