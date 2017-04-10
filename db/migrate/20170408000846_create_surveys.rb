class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.float :annual_revenue
      t.integer :number_of_employees
      t.float :annual_hours_per_employee
      t.float :incivility
      t.float :high_engagement
      t.float :destructive_leadership
      t.float :constructive_leadership
      t.float :additional_rocs_investment

      t.timestamps
    end
  end
end
