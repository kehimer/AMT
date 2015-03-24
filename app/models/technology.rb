class Technology < ActiveRecord::Base
validates_presence_of :title, :description, :benefits, :weight
belongs_to :factor
belongs_to :amt_type
end
