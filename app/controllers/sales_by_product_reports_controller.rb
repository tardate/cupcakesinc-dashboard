class SalesByProductReportsController < ApplicationController
  def index
    @report = ActiveWarehouse::Report::TableReport.new
	@report.cube_name =  :sales_by_product

  end

end
