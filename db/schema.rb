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

ActiveRecord::Schema.define(:version => 20110624134902) do

  create_table "behaviour_log_imports", :force => true do |t|
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "behaviour_logs", :force => true do |t|
    t.integer   "student_id"
    t.integer   "behaviour_reason_id"
    t.integer   "behaviour_outcome_id"
    t.integer   "staff_id"
    t.date      "date"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "period"
    t.integer   "location_id"
    t.integer   "behaviour_log_import_id"
  end

  create_table "behaviour_outcomes", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "behaviour_reasons", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "ethnicities", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "exclusions", :force => true do |t|
    t.integer  "student_id"
    t.integer  "length"
    t.date     "date"
    t.string   "effective_dates"
    t.string   "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "houses", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "reasons", :force => true do |t|
    t.string    "name"
    t.string    "code"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "color",      :default => "000000"
  end

  create_table "sessions", :force => true do |t|
    t.date      "date"
    t.integer   "reason_id"
    t.integer   "student_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "staff_id"
    t.integer   "subject_id"
    t.integer   "referrer_id"
    t.integer   "period"
  end

  create_table "staffs", :force => true do |t|
    t.string    "first_name"
    t.string    "last_name"
    t.string    "salutation"
    t.boolean   "referrer"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "students", :force => true do |t|
    t.string    "upn"
    t.string    "first_name"
    t.string    "last_name"
    t.integer   "year_group_id"
    t.integer   "house_id"
    t.integer   "ethnicity_id"
    t.date      "dob"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "sessions_count",       :default => 0
    t.string    "gender"
    t.boolean   "free_school_meals"
    t.integer   "behaviour_logs_count"
  end

  add_index "students", ["free_school_meals"], :name => "index_students_on_free_school_meals"
  add_index "students", ["gender"], :name => "index_students_on_gender"
  add_index "students", ["upn"], :name => "index_students_on_upn"

  create_table "subjects", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string    "crypted_password"
    t.string    "password_salt"
    t.string    "persistence_token"
    t.string    "single_access_token"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.boolean   "admin",               :default => false
    t.string    "perishable_token",    :default => "",    :null => false
    t.string    "email"
    t.integer   "login_count"
    t.integer   "failed_login_count"
    t.string    "current_login_ip"
    t.string    "last_login_ip"
    t.timestamp "last_login_at"
    t.timestamp "current_login_at"
    t.boolean   "can_register",        :default => false
  end

  create_table "year_groups", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

end
