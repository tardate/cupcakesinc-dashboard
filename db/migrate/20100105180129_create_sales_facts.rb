class CreateSalesFacts < ActiveRecord::Migration
  def self.up
    create_table :sales_facts do |t|
      t.column :date_id, :integer, :null => false
      t.column :customer_id, :integer, :null => false
      t.column :product_id, :integer, :null => false
      t.column :qty, :integer, :default => 0
      t.column :sale_price, :decimal, :precision => 10, :scale => 2, :default => 0

    end
    add_index :sales_facts, :date_id
    add_index :sales_facts, :customer_id
    add_index :sales_facts, :product_id

  end

  def self.down
    drop_table :sales_facts
  end
end
