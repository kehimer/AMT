class Dimention < ActiveRecord::Base
validates_presence_of :title, :weight

belongs_to :priority
has_many :factors

end
