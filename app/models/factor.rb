class Factor < ActiveRecord::Base
validates_presence_of :title, :weight

belongs_to :dimention
has_many :technologies
has_many :factor_survey_results

end
