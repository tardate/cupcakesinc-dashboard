class CustomerDimension < ActiveWarehouse::Dimension
   define_hierarchy :name, [:name]
end