class SalesByProductCube < ActiveWarehouse::Cube
  reports_on :sale_price
  pivots_on :date, :product
 
end