class AddColumnsToSurveys < ActiveRecord::Migration[5.0]
  def change
    add_column :surveys, :productivity_per_employee_hour, :float
    add_column :surveys, :lack_of_high_engagement_costs, :float
    add_column :surveys, :destructive_leadership_costs, :float
    add_column :surveys, :lack_of_contructive_leadership_costs, :float
    add_column :surveys, :employees_experiencing_incivility, :float
    add_column :surveys, :cost_of_time_worrying, :float
    add_column :surveys, :cost_of_avoidance, :float
    add_column :surveys, :cost_of_weak_commitment, :float
    add_column :surveys, :cost_of_effort_reduction, :float
    add_column :surveys, :cost_of_decreased_work_time, :float
    add_column :surveys, :cost_of_job_change_thoughts, :float
    add_column :surveys, :cost_of_employee_job_change, :float
    add_column :surveys, :incivility_cost, :float
    add_column :surveys, :true_tilt_profile, :float
    add_column :surveys, :tilt_365_assessment, :float
    add_column :surveys, :true_tilt_team_profile, :float
    add_column :surveys, :tilt_365_debriefs, :float
    add_column :surveys, :cs_investment, :float
    add_column :surveys, :roi, :float
    add_column :surveys, :payback_period, :float
  end
end
