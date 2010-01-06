class SalesByProductReportsController < ApplicationController
  def index

    @report = ActiveWarehouse::Report::TableReport.new
	@report.title =  "Sales by Product"
	@report.cube_name =  :sales_by_product
	@report.column_dimension_name = :date
	@report.row_dimension_name = :product

	@report_view = @report.view( {}, :with_totals => true)
  end

end
