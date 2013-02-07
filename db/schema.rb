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

ActiveRecord::Schema.define(:version => 20130204212307) do

  create_table "addresses", :force => true do |t|
    t.string   "address"
    t.string   "zip"
    t.string   "city"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "provider",   :null => false
    t.string   "uid",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clubs", :force => true do |t|
    t.string   "name"
    t.string   "initials"
    t.integer  "contact_person"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "website"
    t.string   "cvr"
    t.string   "sport"
    t.string   "merchant_number"
    t.integer  "sms_counter",       :default => 0
    t.string   "street_name"
    t.string   "street_number"
    t.string   "zip"
    t.string   "city"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "clubs_users", :id => false, :force => true do |t|
    t.integer "club_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                                       :null => false
    t.string   "email",                                       :null => false
    t.string   "crypted_password",                            :null => false
    t.string   "password_salt",                               :null => false
    t.string   "persistence_token",                           :null => false
    t.string   "perishable_token",                            :null => false
    t.integer  "login_count",                  :default => 0, :null => false
    t.integer  "failed_login_count",           :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "name"
    t.integer  "roles_mask"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "gender"
    t.date     "birth_day"
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
  end

end
