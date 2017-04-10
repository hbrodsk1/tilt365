require "rails_helper"

RSpec.feature "Create new survey", type: :feature do
	scenario 'User creates survey with valid data' do
		@survey = FactoryGirl.attributes_for(:survey)

		visit 'surveys/new'
		fill_in('Annual Revenue', with: @survey[:annual_revenue])
		fill_in('Number of Employees', with: @survey[:number_of_employees])
		fill_in('Annual Hours per Employee', with: @survey[:annual_hours_per_employee])
		fill_in('Incivility', with: @survey[:incivility])
		fill_in('High Engagement', with: @survey[:high_engagement])
		fill_in('Destructive Leadership', with: @survey[:destructive_leadership])
		fill_in('Constructive Leadership', with: @survey[:constructive_leadership])
		fill_in('Additional ROCS Investment', with: @survey[:additional_rocs_investment])

		click_button('Calculate Your Return')

		expect(page).to have_link("Recalculate Your Return")
		expect(page).to have_link("Calculate A New Return")
	end

	scenario 'User creates survey with invalid data' do
		@invalid_survey = FactoryGirl.attributes_for(:invalid_survey)

		visit 'surveys/new'
		fill_in('Annual Revenue', with: @invalid_survey[:annual_revenue])
		fill_in('Number of Employees', with: @invalid_survey[:number_of_employees])
		fill_in('Annual Hours per Employee', with: @invalid_survey[:annual_hours_per_employee])
		fill_in('Incivility', with: @invalid_survey[:incivility])
		fill_in('High Engagement', with: @invalid_survey[:high_engagement])
		fill_in('Destructive Leadership', with: @invalid_survey[:destructive_leadership])
		fill_in('Constructive Leadership', with: @invalid_survey[:constructive_leadership])
		fill_in('Additional ROCS Investment', with: @invalid_survey[:additional_rocs_investment])

		click_button('Calculate Your Return')

		expect(page).to have_button("Calculate Your Return")
	end	
end