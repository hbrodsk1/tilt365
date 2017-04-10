FactoryGirl.define do
  factory :survey do
    annual_revenue 2000000000.00
    number_of_employees 3500
    annual_hours_per_employee 2080.00
    incivility 25
    high_engagement 40
    destructive_leadership 25
    constructive_leadership 25
    additional_rocs_investment 2000000.00

    productivity_per_employee_hour 274.725274725275 
    lack_of_high_engagement_costs 48000000.0 
    destructive_leadership_costs 25000000.0 
    lack_of_contructive_leadership_costs 37500000.0 
    employees_experiencing_incivility 875.0 
    cost_of_time_worrying 63701.9230769231 
    cost_of_avoidance 33653.8461538462 
    cost_of_weak_commitment 5550000.0 
    cost_of_effort_reduction 528846.153846154 
    cost_of_decreased_work_time 312500.0 
    cost_of_job_change_thoughts 221153.846153846 
    cost_of_employee_job_change 4615384.61538462 
    incivility_cost 60912620.1923077 
    true_tilt_profile 136500.0 
    tilt_365_assessment 112000.0 
    true_tilt_team_profile 23100.0 
    tilt_365_debriefs 245000.0 
    cs_investment 2516600.0 
    roi 2420.43313169783 
    payback_period 4.95779034043485
  end

  factory :survey_2, class: Survey do
     annual_revenue 1000000000.0
     number_of_employees 3500 
     annual_hours_per_employee 2080.0
     incivility 25.0 
     high_engagement 40.0 
     destructive_leadership 25.0 
     constructive_leadership 25.0 
     additional_rocs_investment 2000000.0

     productivity_per_employee_hour 137.362637362637 
     lack_of_high_engagement_costs 24000000.0 
     destructive_leadership_costs 12500000.0
     lack_of_contructive_leadership_costs 18750000.0
     employees_experiencing_incivility 875.0 
     cost_of_time_worrying 31850.9615384615
     cost_of_avoidance 16826.9230769231
     cost_of_weak_commitment 2775000.0 
     cost_of_effort_reduction 264423.076923077 
     cost_of_decreased_work_time 156250.0 
     cost_of_job_change_thoughts 110576.923076923 
     cost_of_employee_job_change 2307692.30769231 
     incivility_cost 30456310.0961538 
     true_tilt_profile 136500.0 
     tilt_365_assessment 112000.0 
     true_tilt_team_profile 23100.0 
     tilt_365_debriefs 245000.0 
     cs_investment 2516600.0 
     roi 1210.21656584892 
     payback_period 9.9155806808697
  end

  factory :invalid_survey, class: Survey do
     annual_revenue 1000000000.0
     number_of_employees 3500 
     annual_hours_per_employee 2080.0
     incivility ""
     high_engagement 40.0 
     destructive_leadership 25.0 
     constructive_leadership 25.0 
     additional_rocs_investment 2000000.0

     productivity_per_employee_hour 137.362637362637 
     lack_of_high_engagement_costs 24000000.0 
     destructive_leadership_costs 12500000.0
     lack_of_contructive_leadership_costs 18750000.0
     employees_experiencing_incivility 875.0 
     cost_of_time_worrying 31850.9615384615
     cost_of_avoidance 16826.9230769231
     cost_of_weak_commitment 2775000.0 
     cost_of_effort_reduction 264423.076923077 
     cost_of_decreased_work_time 156250.0 
     cost_of_job_change_thoughts 110576.923076923 
     cost_of_employee_job_change 2307692.30769231 
     incivility_cost 30456310.0961538 
     true_tilt_profile 136500.0 
     tilt_365_assessment 112000.0 
     true_tilt_team_profile 23100.0 
     tilt_365_debriefs 245000.0 
     cs_investment 2516600.0 
     roi 1210.21656584892 
     payback_period 9.9155806808697
  end
end
