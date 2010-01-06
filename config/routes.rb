ActionController::Routing::Routes.draw do |map|

  map.resources :productreports, :controller => 'sales_by_product_reports'
 
  map.resources :customerreports, :controller => 'sales_by_customer_reports'
 

  map.root :productreports
  
end
