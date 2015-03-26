class AddSurveyResultRefToFactorSurveyResults < ActiveRecord::Migration
  def change
    add_reference :factor_survey_results, :survey_result, index: true
  end
end
