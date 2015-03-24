class CreateFactorSurveyResults < ActiveRecord::Migration
  def change
    create_table :factor_survey_results do |t|
      t.integer :score

      t.timestamps
    end
  end
end
