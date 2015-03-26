class Priority < ActiveRecord::Base
validates_presence_of :title, :weight

has_many :dimentions

end
