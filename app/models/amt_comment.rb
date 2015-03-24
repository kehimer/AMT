class AmtComment < ActiveRecord::Base
validates_presence_of :comment
belongs_to :technology
belongs_to :user
end
