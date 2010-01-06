class ProductDimension < ActiveWarehouse::Dimension
	define_hierarchy :name, [:name]
end