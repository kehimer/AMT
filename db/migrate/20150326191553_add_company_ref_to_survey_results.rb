class AddCompanyRefToSurveyResults < ActiveRecord::Migration
  def change
    add_reference :survey_results, :company, index: true
  end
end
