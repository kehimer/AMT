class SurveyResult < ActiveRecord::Base
belongs_to :company
has_many :factor_survey_result
end
