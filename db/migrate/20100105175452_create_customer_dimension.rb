class CreateCustomerDimension < ActiveRecord::Migration
  def self.up
    fields = {
      :name => :string
    }

    create_table :customer_dimension do |t|
      fields.each do |name,type|
        t.column name, type
      end
    end
	
    fields.each do |name,type|
      add_index :customer_dimension, name unless type == :text      
    end
  end

  def self.down
    drop_table :customer_dimension
  end
end
