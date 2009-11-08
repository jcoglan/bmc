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

ActiveRecord::Schema.define(:version => 20091108190157) do

  create_table "articles", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "source_id"
    t.string   "url"
    t.string   "title"
  end

  add_index "articles", ["source_id"], :name => "index_articles_on_source_id"
  add_index "articles", ["url"], :name => "index_articles_on_url"
  add_index "articles", ["user_id"], :name => "index_articles_on_user_id"

  create_table "domains", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "host"
  end

  create_table "domains_sources", :id => false, :force => true do |t|
    t.integer "domain_id"
    t.integer "source_id"
  end

  add_index "domains_sources", ["domain_id"], :name => "index_domains_sources_on_domain_id"
  add_index "domains_sources", ["source_id"], :name => "index_domains_sources_on_source_id"

  create_table "sources", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "sources", ["name"], :name => "index_sources_on_name"

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "password_hash"
    t.string   "password_salt"
  end

  add_index "users", ["username"], :name => "index_users_on_username"

end
