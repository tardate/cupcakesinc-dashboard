class SalesFact < ActiveWarehouse::Fact
  aggregate :qty, :label => "Units Sold"
  aggregate :sale_price, :label => "Revenue"
  
  dimension :date, :foreign_key => 'date_id', :class_name => 'DateDimension'
  dimension :customer, :foreign_key => 'customer_id', :class_name => 'CustomerDimension'
  dimension :product, :foreign_key => 'product_id', :class_name => 'ProductDimension'

end