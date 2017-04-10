class Survey < ApplicationRecord
	validates :annual_revenue, :number_of_employees, :annual_hours_per_employee, 
				:incivility, :high_engagement, :destructive_leadership,
				:constructive_leadership, :additional_rocs_investment, presence: true

	def calculate		
		calculate_productivity_per_employee_hour
		calculate_lack_of_high_engagement_costs
		calculate_destructive_leadership_costs
		calculate_lack_of_contructive_leadership_costs
		calculate_employees_experiencing_incivility
		calculate_cost_of_time_worrying
		calculate_cost_of_avoidance
		calculate_cost_of_weak_commitment
		calculate_cost_of_effort_reduction
		calculate_cost_of_decreased_work_time
		calculate_cost_of_job_change_thoughts
		calculate_cost_of_employee_job_change
		total_incivility_cost
		calculate_true_tilt_profile
		calculate_tilt_365_assessment
		calculate_true_tilt_team_profile
		calculate_tilt_365_debriefs
		total_cs_investment
		approx_roi
		payback_period_time

		return self
	end

	def calculate_productivity_per_employee_hour
		productivity_per_employee_hour = self[:annual_revenue] / self[:number_of_employees] / self[:annual_hours_per_employee]
		self[:productivity_per_employee_hour] = productivity_per_employee_hour
	end

	def calculate_lack_of_high_engagement_costs
		lack_of_high_engagement_costs = self[:annual_revenue] * 0.04 * ((100 - self[:high_engagement]) / 100)
		self[:lack_of_high_engagement_costs] = lack_of_high_engagement_costs
	end

	def calculate_destructive_leadership_costs
		destructive_leadership_costs = self[:number_of_employees] * self[:annual_hours_per_employee] * self[:productivity_per_employee_hour] * (self[:destructive_leadership] / 100) * 0.05
		self[:destructive_leadership_costs] = destructive_leadership_costs
	end

	def calculate_lack_of_contructive_leadership_costs
		lack_of_contructive_leadership_costs = self[:number_of_employees] * self[:annual_hours_per_employee] * self[:productivity_per_employee_hour] * ((100 - self[:constructive_leadership]) / 100) * 0.025
		self[:lack_of_contructive_leadership_costs] = lack_of_contructive_leadership_costs
	end

	def calculate_employees_experiencing_incivility
		employees_experiencing_incivility = self[:number_of_employees] * ( self[:incivility] / 100 )
		self[:employees_experiencing_incivility] = employees_experiencing_incivility
	end

# ------------Incivility Costs----------------
	def calculate_cost_of_time_worrying
		cost_of_time_worrying = self[:employees_experiencing_incivility] * 0.53 * 0.5 * self[:productivity_per_employee_hour]
		self[:cost_of_time_worrying] = cost_of_time_worrying
	end

	def calculate_cost_of_avoidance
		cost_of_avoidance = self[:employees_experiencing_incivility] * 0.28 * 0.5 * self[:productivity_per_employee_hour]
		self[:cost_of_avoidance] = cost_of_avoidance
	end

	def calculate_cost_of_weak_commitment
		cost_of_weak_commitment = self[:employees_experiencing_incivility] * 0.37 * self[:productivity_per_employee_hour] * (self[:annual_hours_per_employee] * 0.03)
		self[:cost_of_weak_commitment] = cost_of_weak_commitment
	end

	def calculate_cost_of_effort_reduction
		cost_of_effort_reduction = self[:employees_experiencing_incivility] * 0.22 * self[:productivity_per_employee_hour] * 10
		self[:cost_of_effort_reduction] = cost_of_effort_reduction
	end

	def calculate_cost_of_decreased_work_time
		cost_of_decreased_work_time = self[:employees_experiencing_incivility] * 0.1 * 13 * self[:productivity_per_employee_hour]
		self[:cost_of_decreased_work_time] = cost_of_decreased_work_time
	end

	def calculate_cost_of_job_change_thoughts
		cost_of_job_change_thoughts = self[:employees_experiencing_incivility] * 0.46 * 2 * self[:productivity_per_employee_hour]
		self[:cost_of_job_change_thoughts] = cost_of_job_change_thoughts
	end

	def calculate_cost_of_employee_job_change
		cost_of_employee_job_change = self[:employees_experiencing_incivility] * 0.12 * 160 * self[:productivity_per_employee_hour]
		self[:cost_of_employee_job_change] = cost_of_employee_job_change
	end

	def total_incivility_cost
		incivility_cost_info = [self[:lack_of_contructive_leadership_costs], self[:destructive_leadership_costs],
							self[:lack_of_high_engagement_costs], self[:cost_of_time_worrying], 
							self[:cost_of_avoidance], self[:cost_of_weak_commitment], 
							self[:cost_of_effort_reduction], self[:cost_of_decreased_work_time], 
							self[:cost_of_job_change_thoughts], self[:cost_of_employee_job_change]]

		self[:incivility_cost] = incivility_cost_info.inject(0, :+) * 0.5
	end

# ------------CS Investment----------------
	def calculate_true_tilt_profile
		true_tilt_profile = 39 * self[:number_of_employees]
		self[:true_tilt_profile] = true_tilt_profile
	end

	def calculate_tilt_365_assessment
		tilt_365_assessment = 160 * self[:number_of_employees] * 0.2
		self[:tilt_365_assessment] = tilt_365_assessment
	end

	def calculate_true_tilt_team_profile
		true_tilt_team_profile = self[:number_of_employees].to_f / 15 * 99
		self[:true_tilt_team_profile] = true_tilt_team_profile
	end

	def calculate_tilt_365_debriefs
		tilt_365_debriefs = self[:number_of_employees] * 0.2 * 350
		self[:tilt_365_debriefs] = tilt_365_debriefs
	end

	def total_cs_investment
		cs_investment_info = [self[:true_tilt_profile], self[:tilt_365_assessment],
							self[:true_tilt_team_profile], self[:tilt_365_debriefs],
							self[:additional_rocs_investment]]

		self[:cs_investment] = cs_investment_info.inject(0, :+)
	end

# ------------Returns----------------	
	def approx_roi
		roi = self[:incivility_cost] / self[:cs_investment] * 100
		self[:roi] = roi
	end


	def payback_period_time
		payback_period = self[:cs_investment] / (self[:incivility_cost] / 10) * 12
		self[:payback_period] = payback_period
	end
end
