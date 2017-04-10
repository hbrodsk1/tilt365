require 'rails_helper'

RSpec.describe SurveysController, type: :controller do
	describe '#new' do
		it "responds successfully with an HTTP 200 status code" do
			get :new
			expect(response).to have_http_status(200)
		end

		it "renders the new template" do
			get :new
			expect(response).to render_template('new')
		end

		it "assigns new survey as @survey" do
			get :new
			expect(assigns(:survey)).to be_a_new(Survey)
		end
	end

	describe '#show' do
		let(:survey) { FactoryGirl.create(:survey) }

 		it "responds successfuly with an HTTP 200 status code" do
			get :show, params: { id: survey }
			expect(response).to have_http_status(200)
		end

		it "render renders the show template" do
			get :show, params: { id: survey }
			expect(response).to render_template('show')
		end

		it "assigns the requested survey to @survey" do
			get :show, params: { id: survey }
			expect(assigns(:survey)).to eq(survey)
		end
	end

	describe '#create' do
		context "with valid attributes" do
			let(:survey_params) { FactoryGirl.attributes_for(:survey) }

			it "creates a new survey" do
				expect { post :create, params: { :survey => survey_params } }.to change(Survey, :count).by(1)
			end

			it "redirects to survey page" do
				post :create, params: { :survey => survey_params }
				expect(response).to redirect_to(assigns(:survey))
			end
		end

		context "with invalid attributes" do
			let(:invalid_survey_params) { FactoryGirl.attributes_for(:invalid_survey) }

			it "does not create a new survey" do
				expect { post :create, params: { :survey => invalid_survey_params } }.to_not change(Survey, :count)
			end

			it "renders the new template" do
				post :create, params: { :survey => invalid_survey_params }
				expect(response).to render_template('new')
			end
		end
	end

	describe '#edit' do
		let(:survey) { FactoryGirl.create(:survey) }

		it "responds successfully with an HTTP 200 status code" do
			get :edit, params: { id: survey }
			expect(response).to have_http_status(200)
		end

		it "renders the edit template" do
			get :edit, params: { id: survey }
			expect(response).to render_template('edit')
		end

		it "assigns the requested survey to @survey" do
			get :edit, params: { id: survey }
			expect(assigns(:survey)).to eq(survey)
		end
	end

	describe '#update' do
		let(:survey) { FactoryGirl.create(:survey) }
		let(:updated_attributes) { FactoryGirl.attributes_for(:survey_2) }
		let(:invalid_updated_attributes) { FactoryGirl.attributes_for(:invalid_survey) }

		context "with valid attributes" do
			it "assigns the requested survey to @survey" do
				patch :update, params: { id: survey, :survey => updated_attributes }
				expect(assigns(:survey)).to eq(survey)
			end

			it "updates survey attributes" do
				patch :update, params: { id: survey, :survey => updated_attributes }
				survey.reload
				expect(survey).to have_attributes(FactoryGirl.attributes_for(:survey_2))
			end

			it "redirects to survey page" do
				patch :update, params: { id: survey, :survey => updated_attributes }
				expect(response).to redirect_to(survey_url(survey))
			end
		end

		context "with invalid attributes" do
			it "does not update survey" do
				patch :update, params: { id: survey, :survey => invalid_updated_attributes }
				survey.reload
				expect(survey).to have_attributes(FactoryGirl.attributes_for(:survey))
			end

			it "renders the edit template" do
				patch :update, params: { id: survey, :survey => invalid_updated_attributes }
				expect(response).to render_template('edit')
			end
		end
	end
end
