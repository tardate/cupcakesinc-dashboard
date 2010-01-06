class SalesByProductCube < ActiveWarehouse::Cube
  reports_on :sales
  pivots_on({ :date => :calendar_year }, {:product => :name})
 
end