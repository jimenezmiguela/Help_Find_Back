class Api::V1::StatusReportsController < ApplicationController
  include AuthenticationCheck

  before_action :is_user_logged_in
  before_action :set_status_report, only: [:show, :update, :destroy]

  # GET /missing_persons/:missing_person_id/status_reports
  def index
    @missingPerson = MissingPerson.find(params[:missing_person_id])
    render json: @missingPerson.status_reports
  end

  # GET /missing_persons/:missing_person_id/status_reports/:id
  def show
    @missingPerson = MissingPerson.find(params[:missing_person_id])
		@statusReport = @missingPerson.status_reports.find(params[:id])
    if @statusReport = @missingPerson.status_reports.find(params[:id])
		render json: @statusReport, status: 200
		# 200:  successfully found it
		else
		render json: { error:
		"Could not show status report: #{@statusReport.errors.full_messages.to_sentence}"},
		status: 204
    # 204:  No content
    end
  end

  # POST /missing_persons/:missing_person_id/status_reports
  def create
     @missingPerson = MissingPerson.find(params[:missing_person_id])
    @statusReport = @missingPerson.status_reports.new(status_report_params)
    if @statusReport.save
      render json: @statusReport, status: 201
			# 201:  successfully created
    else
      render json: { error:
        "Status report could not be created. #{@statusReport.errors.full_messages.to_sentence}"},
      status: 400
			  # 400:  bad request
    end
  end

  # PUT /missing_persons/:missing_person_id/status_reports/:id
  def update
    @missingPerson = MissingPerson.find(params[:missing_person_id])
		@statusReport = @missingPerson.status_reports.find(params[:id])
		if @statusReport.update(status_report_params)
		render json: @statusReport

		else
		render json: { error:
		"Could not update status report: #{@statusReport.errors.full_messages.to_sentence}"},
		status: 404
		# 404:  Not found
    end
  end

  # DELETE /missing_persons/:missing_person_id/status_report/:id
  def destroy
    @statusReport.destroy
		render json: {message:  "You have deleted status report."}, status: 200
		# 200:  success
  end

  private

  def status_report_params
    params.require(:status_report).permit(:case_id, :description, :details, :image_url)
  end

  def set_status_report
    @statusReport = StatusReport.find(params[:id])
  end

end
