# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120216184745) do

  create_table "whurl_engine_categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "whurl_engine_header_definitions", :force => true do |t|
    t.integer  "resource_id"
    t.string   "name"
    t.string   "example_value"
    t.text     "description"
    t.boolean  "required"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "whurl_engine_parameter_definitions", :force => true do |t|
    t.integer  "resource_id"
    t.string   "name"
    t.string   "example_value"
    t.text     "description"
    t.boolean  "required"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "whurl_engine_resources", :force => true do |t|
    t.integer  "category_id"
    t.string   "base_uri"
    t.string   "relative_path"
    t.string   "http_method"
    t.text     "description"
    t.boolean  "rate_limited"
    t.boolean  "requires_authentication"
    t.text     "response_formats"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "whurl_engine_whurls", :force => true do |t|
    t.string   "hash_key",              :limit => 6,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.string   "name"
    t.string   "request_method",        :limit => 10
    t.text     "request_body"
    t.text     "request_parameters"
    t.text     "request_headers"
    t.text     "request_url"
    t.integer  "resource_id"
    t.text     "response_body"
    t.string   "response_content_type"
    t.text     "response_headers"
    t.text     "raw_request"
    t.string   "response_message"
    t.string   "basic_auth_user"
    t.string   "basic_auth_password"
  end

  add_index "whurl_engine_whurls", ["hash_key"], :name => "index_whurls_on_hash_key", :unique => true

end
