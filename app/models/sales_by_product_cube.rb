class SalesByProductCube < ActiveWarehouse::Cube
  reports_on :sales
  pivots_on :date, {:product => :name} #({:date => :cy}, {:product => :name})
 
end