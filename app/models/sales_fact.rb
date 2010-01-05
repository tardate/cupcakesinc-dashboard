class SalesFact < ActiveWarehouse::Fact
  aggregate :qty
  aggregate :sale_price
  

  belongs_to :date, :foreign_key => 'date_id', :class_name => 'DateDimension'
  belongs_to :customer, :foreign_key => 'customer_id', :class_name => 'CustomerDimension'
  belongs_to :product, :foreign_key => 'product_id', :class_name => 'ProductDimension'

end