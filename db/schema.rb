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

ActiveRecord::Schema.define(:version => 20111127231846) do

  create_table "activities", :force => true do |t|
    t.string   "activity_type"
    t.text     "text"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "user_id"
  end

  create_table "admin_notes", :force => true do |t|
    t.integer  "resource_id",     :null => false
    t.string   "resource_type",   :null => false
    t.integer  "admin_user_id"
    t.string   "admin_user_type"
    t.text     "body"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "admin_notes", ["admin_user_type", "admin_user_id"], :name => "index_admin_notes_on_admin_user_type_and_admin_user_id"
  add_index "admin_notes", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "annotations", :force => true do |t|
    t.text     "description"
    t.integer  "x"
    t.integer  "y"
    t.integer  "height"
    t.integer  "width"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "text"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
  end

  create_table "competencies", :force => true do |t|
    t.string   "name"
    t.string   "rating"
    t.text     "description"
    t.integer  "profile_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "confirms", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "event_id"
  end

  create_table "declines", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "event_id"
  end

  create_table "educations", :force => true do |t|
    t.string   "country"
    t.string   "education_level"
    t.string   "field_of_study"
    t.string   "institution"
    t.date     "attended_from"
    t.date     "attended_to"
    t.text     "add_notes"
    t.integer  "profile_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "venue"
    t.datetime "event_date"
    t.time     "event_time"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.integer  "wall_id"
    t.string   "invites"
    t.string   "attendance"
  end

  create_table "experiences", :force => true do |t|
    t.string   "company_name"
    t.string   "country"
    t.string   "industry"
    t.date     "hired_from"
    t.date     "hired_to"
    t.string   "job_title"
    t.text     "responsability"
    t.text     "reason_leaving"
    t.string   "salary"
    t.text     "add_notes"
    t.integer  "profile_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.integer  "wall_id"
  end

  create_table "jobs", :force => true do |t|
    t.string   "job_title"
    t.string   "job_type"
    t.string   "job_category"
    t.string   "working_location"
    t.text     "responsability"
    t.string   "lowest_education_level"
    t.string   "highest_education_level"
    t.integer  "age_min"
    t.integer  "age_max"
    t.string   "salary_min"
    t.string   "salary_max"
    t.boolean  "negotiable"
    t.boolean  "travel"
    t.boolean  "relocate"
    t.integer  "user_id"
    t.integer  "company_id"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "languages", :force => true do |t|
    t.string   "language"
    t.string   "level"
    t.integer  "profile_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "likes", :force => true do |t|
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "likeable_id"
    t.string   "likeable_type"
    t.integer  "user_id"
    t.string   "author"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "member_id"
  end

  create_table "mentions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "status_id"
  end

  create_table "messages", :force => true do |t|
    t.string   "topic"
    t.text     "body"
    t.integer  "received_messageable_id"
    t.string   "received_messageable_type"
    t.integer  "sent_messageable_id"
    t.string   "sent_messageable_type"
    t.boolean  "opened",                     :default => false
    t.boolean  "recipient_delete",           :default => false
    t.boolean  "sender_delete",              :default => false
    t.boolean  "recipient_permanent_delete", :default => false
    t.boolean  "sender_permanent_delete",    :default => false
    t.boolean  "r_hidden"
    t.boolean  "s_hidden"
    t.string   "recipient"
    t.integer  "recipient_id"
    t.integer  "user_id"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.string   "ancestry"
  end

  add_index "messages", ["ancestry"], :name => "index_messages_on_ancestry"
  add_index "messages", ["sent_messageable_id", "received_messageable_id"], :name => "acts_as_messageable_ids"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "group_id"
    t.integer  "pageable_id"
    t.string   "pageable_type"
  end

  create_table "pendings", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "event_id"
  end

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.string   "caption"
    t.string   "privacy",    :default => "public"
    t.string   "format"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "posts", :force => true do |t|
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "wall_id"
  end

  create_table "preferences", :force => true do |t|
    t.text     "job_titles"
    t.string   "job_type"
    t.string   "job_categories"
    t.string   "expected_salary"
    t.boolean  "able_to_travel"
    t.boolean  "able_to_relocate"
    t.string   "preferred_location"
    t.boolean  "shift"
    t.integer  "profile_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_birth"
    t.string   "gender"
    t.string   "marital_status"
    t.string   "current_drawn"
    t.string   "availability"
    t.string   "mobile_number"
    t.string   "home_number"
    t.string   "work_number"
    t.string   "education_level"
    t.text     "skills"
    t.string   "image"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "references", :force => true do |t|
    t.string   "name"
    t.string   "relationship"
    t.string   "email"
    t.string   "phone_number"
    t.string   "company_name"
    t.string   "job_title"
    t.integer  "profile_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "relationships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "follower_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "replies", :force => true do |t|
    t.text     "body"
    t.integer  "author_id"
    t.integer  "message_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "requests", :force => true do |t|
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "from_id"
  end

  create_table "statuses", :force => true do |t|
    t.string   "text",         :limit => 160
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "user_id"
    t.integer  "recipient_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.string   "username"
    t.string   "role"
    t.string   "formatted_name"
    t.string   "sex",                    :limit => 6
    t.string   "relationship_status"
    t.string   "provider"
    t.string   "identifier"
    t.string   "photo_url"
    t.string   "location"
    t.string   "description"
    t.text     "interests"
    t.text     "education"
    t.integer  "wall_id"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "walls", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
