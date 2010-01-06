class SalesFact < ActiveWarehouse::Fact
  aggregate :qty
  aggregate :sale_price
  
  dimension :date, :foreign_key => 'date_id', :class_name => 'DateDimension'
  dimension :customer, :foreign_key => 'customer_id', :class_name => 'CustomerDimension'
  dimension :product, :foreign_key => 'product_id', :class_name => 'ProductDimension'

end