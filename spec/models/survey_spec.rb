require 'rails_helper'

RSpec.describe Survey, type: :model do
  
  it "has a valid factory" do
  	expect(FactoryGirl.create(:survey)).to be_valid
  end

  context 'Validations' do
  	it { is_expected.to validate_presence_of(:annual_revenue) }
	it { is_expected.to validate_presence_of(:number_of_employees) }
	it { is_expected.to validate_presence_of(:annual_hours_per_employee) }
	it { is_expected.to validate_presence_of(:incivility) }
	it { is_expected.to validate_presence_of(:high_engagement) }
	it { is_expected.to validate_presence_of(:destructive_leadership) }
	it { is_expected.to validate_presence_of(:constructive_leadership) }
	it { is_expected.to validate_presence_of(:additional_rocs_investment) }
  end

  before(:each) do
    @survey = FactoryGirl.create(:survey)
  end	
  
  describe '#calculate_productivity_per_employee_hour' do
  	it "sets @survey[:productivity_per_eemployee_hour]" do
  		expect(@survey.calculate_productivity_per_employee_hour).to be_within(0.1).of(274.73)
  	end
  end

  describe '#calculate_lack_of_high_engagement_costs' do
  	it "sets @survey[:lack_of_high_engagement_cost]" do
  		expect(@survey.calculate_lack_of_high_engagement_costs).to eq(48000000.00)
  	end
  end

  describe '#calculate_destructive_leadership_costs' do
  	it "sets @survey[:destructive_leadership_cost]" do
  		@survey[:productivity_per_employee_hour] = 274.725274
  		expect(@survey.calculate_destructive_leadership_costs).to be_within(0.1).of(25000000.00)
  	end
  end

  describe '#calculate_lack_of_contructive_leadership_costs' do
  	it "sets @survey[:lack_of_constructive_leadership_cost]" do
  		@survey[:productivity_per_employee_hour] = 274.725274
  		expect(@survey.calculate_lack_of_contructive_leadership_costs).to be_within(0.1).of(37500000.00)
  	end
  end

  describe '#calculate_employees_experiencing_incivility' do
  	it "sets @survey[:employees_experiencing_incivility]" do
  		expect(@survey.calculate_employees_experiencing_incivility).to be_within(0.1).of(875.00)
  	end
  end

  describe '#calculate_cost_of_time_worrying' do
  	it "sets @survey[:cost_of_time_worrying]" do
  		@survey[:productivity_per_employee_hour] = 274.725274
  		@survey[:employees_experiencing_incivility] = 875.00
  		expect(@survey.calculate_cost_of_time_worrying).to be_within(0.1).of(63701.92)
  	end
  end

  describe '#calculate_cost_of_avoidance' do
  	it "sets @survey[:cost_of_avoidance]" do
  		@survey[:productivity_per_employee_hour] = 274.725274
  		@survey[:employees_experiencing_incivility] = 875.00
  		expect(@survey.calculate_cost_of_avoidance).to be_within(0.1).of(33653.85)
  	end
  end

  describe '#calculate_cost_of_weak_commitment' do
  	it "sets @survey[:cost_of_weak_commitment]" do
  		@survey[:productivity_per_employee_hour] = 274.725274
  		@survey[:employees_experiencing_incivility] = 875.00
  		expect(@survey.calculate_cost_of_weak_commitment).to be_within(0.1).of(5550000.00)
  	end
  end

  describe '#calculate_cost_of_effort_reduction' do
  	it "sets @survey[:cost_of_effort_reduction]" do
  		@survey[:productivity_per_employee_hour] = 274.725274
  		@survey[:employees_experiencing_incivility] = 875.00
  		expect(@survey.calculate_cost_of_effort_reduction).to be_within(0.1).of(528846.15)
  	end
  end

  describe '#calculate_cost_of_decreased_work_time' do
  	it "sets @survey[:cost_of_decreased_work_time]" do
  		@survey[:productivity_per_employee_hour] = 274.725274
  		@survey[:employees_experiencing_incivility] = 875.00
  		expect(@survey.calculate_cost_of_decreased_work_time).to be_within(0.1).of(312500.00)
  	end
  end

  describe '#calculate_cost_of_job_change_thoughts' do
  	it "sets @survey[:cost_of_job_change_thoughts]" do
  		@survey[:productivity_per_employee_hour] = 274.725274
  		@survey[:employees_experiencing_incivility] = 875.00
  		expect(@survey.calculate_cost_of_job_change_thoughts).to be_within(0.1).of(221153.85)
  	end
  end

  describe '#calculate_cost_of_employee_job_change' do
  	it "sets @survey[:cost_of_employee_job_change]" do
  		@survey[:productivity_per_employee_hour] = 274.725274
  		@survey[:employees_experiencing_incivility] = 875.00
  		expect(@survey.calculate_cost_of_employee_job_change).to be_within(0.1).of(4615384.62)
  	end
  end

  describe '#calculate_true_tilt_profile' do
  	it "sets @survey[:true_tilt_profile]" do
  		expect(@survey.calculate_true_tilt_profile).to be_within(0.1).of(136500.00)
  	end
  end

  describe '#calculate_tilt_365_assessment' do
  	it "sets @survey[:tilt_365_assessment]" do
  		expect(@survey.calculate_tilt_365_assessment).to be_within(0.1).of(112000.00)
  	end
  end

  describe '#calculate_true_tilt_team_profile' do
  	it "sets @survey[:true_tilt_team_profile]" do
  		expect(@survey.calculate_true_tilt_team_profile).to be_within(0.1).of(23100.00)
  	end
  end 

  describe '#calculate_tilt_365_debriefs' do
  	it "sets @survey[:tilt_365_debriefs]" do
  		expect(@survey.calculate_tilt_365_debriefs).to be_within(0.1).of(245000.00)
  	end
  end

  describe '#total_cs_investment' do
  	it "sets @survey[:cs_investment]" do
  		@survey[:true_tilt_profile] = 136500.00
  		@survey[:tilt_365_assessment] = 112000.00
		@survey[:true_tilt_team_profile] = 23100.00
		@survey[:tilt_365_debriefs] = 245000.00

  		expect(@survey.total_cs_investment).to be_within(0.1).of(2516600.00)
  	end
  end

  describe '#total_incivility_cost' do
  	it "sets @survey[:incivility_cost]" do
  		@survey[:productivity_per_employee_hour] = 274.725274
  		@survey[:lack_of_contructive_leadership_costs] = 37500000.00
  		@survey[:destructive_leadership_costs] = 25000000.00 
  		@survey[:lack_of_high_engagement_costs] = 48000000.00
  		@survey[:cost_of_time_worrying] = 63701.92
		@survey[:cost_of_avoidance] = 33653.85
		@survey[:cost_of_weak_commitment] = 5550000.00
		@survey[:cost_of_effort_reduction] = 528846.15
		@survey[:cost_of_decreased_work_time] = 312500.00
		@survey[:cost_of_job_change_thoughts] = 221153.85
		@survey[:cost_of_employee_job_change] = 4615384.62

  		expect(@survey.total_incivility_cost).to be_within(0.1).of(60912620.19)
  	end
  end

  describe '#approx roi' do
  	it "sets @survey[:approx_roi]" do
  		@survey[:incivility_cost] = 60912620.19
  		@survey[:cs_investment] = 2516600.00

  		expect(@survey.approx_roi).to be_within(0.1).of(2420.43)
  	end
  end

  describe '#payback_period_time' do
  	it "sets @survey[:payback_period]" do
  		@survey[:incivility_cost] = 60912620.19
  		@survey[:cs_investment] = 2516600.00

  		expect(@survey.payback_period_time).to be_within(0.1).of(4.96)
  	end
  end     
end
