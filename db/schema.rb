# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110508211541) do

  create_table "clients", :force => true do |t|
    t.string   "title",      :limit => 100, :null => false
    t.string   "email",      :limit => 100, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["email"], :name => "index_clients_on_email", :unique => true

  create_table "entries", :force => true do |t|
    t.integer  "listener_id", :null => false
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["listener_id"], :name => "listener_id_idx"

  create_table "listeners", :force => true do |t|
    t.integer  "client_id",                                       :null => false
    t.string   "title"
    t.string   "token",         :limit => 32,                     :null => false
    t.datetime "last_entry_at"
    t.integer  "alert_delay",                 :default => 172800, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "listeners", ["client_id"], :name => "client_id_idx"

end
