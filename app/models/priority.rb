class Priority < ActiveRecord::Base
validates_presence_of :title, :weight

end
