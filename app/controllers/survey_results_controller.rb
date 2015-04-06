class SurveyResultsController < ApplicationController

  def index
    @survey_results = SurveyResult.order(:created_at)
  end

  def show
    @survey_result = SurveyResult.find(params[:id])
  end

  def new
    @survey_result = SurveyResult.new
  end

  def create
    @survey_result = SurveyResult.new
  end

  def edit
    @survey_result = SurveyResult.find(params[:id])
  end

  def update
    @survey_result = SurveyResult.find(params[:id])
  end

private
    def survey_result_params
      params.require(:survey_result).permit!
    end

end
