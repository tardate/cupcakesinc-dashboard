
ETL::Engine.logger = Logger.new(STDOUT)
#ETL::Engine.logger.level = Logger::DEBUG

source :in, {
  :type => :database,
  :target => :cupcake_development,
  :database => 'cupcake_development',
  :table => 'products'
}, 
[ 
  :id, :name
]

pre_process :truncate, :target => :development, :table => 'product_dimension'

destination :out, {
  :type => :database,
  :target => :development,
  :database => 'cupcake_dw_development',
  :table => 'product_dimension'
},
{
  :order => [:id, :name ]
}