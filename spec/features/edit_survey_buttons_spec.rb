require "rails_helper"

RSpec.feature "edit.html.erb buttons", type: :feature do
	scenario 'User clicks on Recalculate Your Return button' do
		@survey = FactoryGirl.create(:survey)

		visit "/surveys/#{@survey.id}"
		first(:link, 'Recalculate Your Return').click

		expect(page).to have_current_path(edit_survey_path(@survey))
	end	

	scenario 'User clicks on Calculate A New Return button' do
		@survey = FactoryGirl.create(:survey)

		visit "/surveys/#{@survey.id}"
		first(:link, 'Calculate A New Return').click

		expect(page).to have_current_path(new_survey_path)
	end		
end