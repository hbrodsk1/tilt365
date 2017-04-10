class SurveysController < ApplicationController

	def new
		@survey = Survey.new
	end

	def create
		@survey = Survey.new(survey_params)
		@survey.calculate
		if @survey.save
			
			redirect_to(@survey)
		else
			render 'new'
		end
	end

	def edit
		@survey = Survey.find(params[:id])
	end

	def update
		@survey = Survey.find(params[:id])

		if @survey.update(survey_params)
			@survey.calculate
			@survey.update(survey_params)
			redirect_to(@survey)
		else
			render 'edit'
		end
	end

	def show
		@survey = Survey.find(params[:id])
	end

	private

	def survey_params
		params.require(:survey).permit(:annual_revenue, :number_of_employees, :annual_hours_per_employee, 
				:incivility, :high_engagement, :destructive_leadership,
				:constructive_leadership, :additional_rocs_investment)
	end
end
