class SalesByProductReportsController < ApplicationController
  def index
	report_params = {
		:title => "Sales by Product",
		:cube_name =>  :sales_by_product,
		:column_dimension_name => :date,
		:row_dimension_name => :product
	} 
    @report = ActiveWarehouse::Report::TableReport.new
#	@report.title =  "Sales by Product"
	@report.cube_name =  :sales_by_product
	@report.column_dimension_name = :date
	@report.row_dimension_name = :product

	
	params = { "c_calendar_year" => "2009", :cstage => 0 }
	@report_view = @report.view( params, :with_totals => true)
  end

end
