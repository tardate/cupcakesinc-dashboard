# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100105180129) do

  create_table "customer_dimension", :force => true do |t|
    t.string "name"
  end

  add_index "customer_dimension", ["name"], :name => "index_customer_dimension_on_name"

  create_table "date_dimension", :force => true do |t|
    t.string  "calendar_week"
    t.string  "calendar_quarter"
    t.string  "calendar_week_ending_date"
    t.string  "calendar_year_quarter"
    t.integer "calendar_week_number_in_year"
    t.string  "calendar_year"
    t.string  "day_of_week"
    t.string  "calendar_month_name"
    t.string  "date"
    t.string  "major_event"
    t.integer "day_number_in_calendar_month"
    t.integer "calendar_month_number_in_year"
    t.date    "sql_date_stamp"
    t.integer "day_number_in_calendar_year"
    t.string  "calendar_year_month"
  end

  add_index "date_dimension", ["calendar_month_name"], :name => "index_date_dimension_on_calendar_month_name"
  add_index "date_dimension", ["calendar_month_number_in_year"], :name => "index_date_dimension_on_calendar_month_number_in_year"
  add_index "date_dimension", ["calendar_quarter"], :name => "index_date_dimension_on_calendar_quarter"
  add_index "date_dimension", ["calendar_week"], :name => "index_date_dimension_on_calendar_week"
  add_index "date_dimension", ["calendar_week_ending_date"], :name => "index_date_dimension_on_calendar_week_ending_date"
  add_index "date_dimension", ["calendar_week_number_in_year"], :name => "index_date_dimension_on_calendar_week_number_in_year"
  add_index "date_dimension", ["calendar_year"], :name => "index_date_dimension_on_calendar_year"
  add_index "date_dimension", ["calendar_year_month"], :name => "index_date_dimension_on_calendar_year_month"
  add_index "date_dimension", ["calendar_year_quarter"], :name => "index_date_dimension_on_calendar_year_quarter"
  add_index "date_dimension", ["date"], :name => "index_date_dimension_on_date"
  add_index "date_dimension", ["day_number_in_calendar_month"], :name => "index_date_dimension_on_day_number_in_calendar_month"
  add_index "date_dimension", ["day_number_in_calendar_year"], :name => "index_date_dimension_on_day_number_in_calendar_year"
  add_index "date_dimension", ["day_of_week"], :name => "index_date_dimension_on_day_of_week"
  add_index "date_dimension", ["major_event"], :name => "index_date_dimension_on_major_event"
  add_index "date_dimension", ["sql_date_stamp"], :name => "index_date_dimension_on_sql_date_stamp"

  create_table "product_dimension", :force => true do |t|
    t.string "name"
  end

  add_index "product_dimension", ["name"], :name => "index_product_dimension_on_name"

  create_table "sales_facts", :force => true do |t|
    t.integer "date_id",                                                     :null => false
    t.integer "customer_id",                                                 :null => false
    t.integer "product_id",                                                  :null => false
    t.integer "qty",                                        :default => 0
    t.decimal "sale_price",  :precision => 10, :scale => 2, :default => 0.0
  end

  add_index "sales_facts", ["customer_id"], :name => "index_sales_facts_on_customer_id"
  add_index "sales_facts", ["date_id"], :name => "index_sales_facts_on_date_id"
  add_index "sales_facts", ["product_id"], :name => "index_sales_facts_on_product_id"

end
