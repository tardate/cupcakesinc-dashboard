
ETL::Engine.logger = Logger.new(STDOUT)
#ETL::Engine.logger.level = Logger::DEBUG

source :in, {
  :type => :database,
  :target => :cupcake_development,
  :database => 'cupcake_development',
  :table => 'order_items'
}, 
[ 
  :id, :order_id, :product_id, :qty, :unit_price
]

pre_process :truncate, :target => :development, :table => 'sales_facts'

after_read do |row| 
	row[:date_id] = 0
	row[:customer_id] = 0
	row 
end
#before_write :surrogate_key, :target => :cupcake_development, :table => 'orders', :column => 'id'


destination :out, {
  :type => :database,
  :target => :development,
  :database => 'cupcake_dw_development',
  :table => 'sales_facts'
},
{
  :order => [ :date_id, :customer_id, :product_id, :qty, :sale_price ]
}