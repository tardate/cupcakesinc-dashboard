# optionally, turn on debug settings
ETL::Engine.logger = Logger.new(STDOUT)
ETL::Engine.logger.level = Logger::DEBUG

# source from the cupcakes website database
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

# :order_date is sourced as string in the native format "yyyy-mm-dd hh:mm:ss". The following copies it to :date_id and transforms
# into string format "yyyy-mm-dd" which is compatible with the cached date values used in :foreign_key_lookup transform
# There's probably a more efficient way of doing this, but I haven't found it yet.
after_read :copy_field, :destination => :date_id, :source => :order_date
transform :date_id, :string_to_date
transform :date_id, :date_to_string, :format => "%Y-%m-%d"

transform :date_id, :foreign_key_lookup, {
	:resolver => SQLResolver.new( 'date_dimension', 'sql_date_stamp', :development ),
	:default => 1
}

# rename the unit_price column to sale_price (by copy)
before_write :copy_field, :destination => :sale_price, :source => :unit_price

# write to the cupcakes warehouse database
destination :out, {
  :type => :database,
  :target => :development,
  :database => 'cupcake_dw_development',
  :table => 'sales_facts'
},
{
  :order => [ :date_id, :customer_id, :product_id, :qty, :sale_price ]
}