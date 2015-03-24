class FactorSurveyResult < ActiveRecord::Base
belongs_to :factor
belongs_to :survey_result
validates_presence_of :score
validates_numericality_of :score, greater_than_or_equal_to: 1
validates_numericality_of :score, less_than_or_equal_to: 5

  
end
