class AmtType < ActiveRecord::Base
validates_presence_of :title

has_many :technologys

end
