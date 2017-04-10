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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170409222846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "surveys", force: :cascade do |t|
    t.float    "annual_revenue"
    t.integer  "number_of_employees"
    t.float    "annual_hours_per_employee"
    t.float    "incivility"
    t.float    "high_engagement"
    t.float    "destructive_leadership"
    t.float    "constructive_leadership"
    t.float    "additional_rocs_investment"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.float    "productivity_per_employee_hour"
    t.float    "lack_of_high_engagement_costs"
    t.float    "destructive_leadership_costs"
    t.float    "lack_of_contructive_leadership_costs"
    t.float    "employees_experiencing_incivility"
    t.float    "cost_of_time_worrying"
    t.float    "cost_of_avoidance"
    t.float    "cost_of_weak_commitment"
    t.float    "cost_of_effort_reduction"
    t.float    "cost_of_decreased_work_time"
    t.float    "cost_of_job_change_thoughts"
    t.float    "cost_of_employee_job_change"
    t.float    "incivility_cost"
    t.float    "true_tilt_profile"
    t.float    "tilt_365_assessment"
    t.float    "true_tilt_team_profile"
    t.float    "tilt_365_debriefs"
    t.float    "cs_investment"
    t.float    "roi"
    t.float    "payback_period"
  end

end
