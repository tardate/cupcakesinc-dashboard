class SalesByCustomerReportsController < ApplicationController
  def index
      @report = ActiveWarehouse::Report::TableReport.new
	@report.title =  "Sales by Customer"
	@report.cube_name =  :sales_by_customer
	@report.column_dimension_name = :date
	@report.row_dimension_name = :customer

	@report_view = @report.view( params, :with_totals => true)
  end

end
