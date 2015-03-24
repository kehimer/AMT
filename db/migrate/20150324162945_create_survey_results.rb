class CreateSurveyResults < ActiveRecord::Migration
  def change
    create_table :survey_results do |t|
      t.string :filled_by

      t.timestamps
    end
  end
end
