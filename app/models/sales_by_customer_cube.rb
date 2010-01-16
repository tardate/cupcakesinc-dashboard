class SalesByCustomerCube < ActiveWarehouse::Cube
    reports_on :sales
    pivots_on({ :date => :calendar_year }, {:customer => :name}) 
end