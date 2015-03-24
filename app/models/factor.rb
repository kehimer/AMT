class Factor < ActiveRecord::Base
validates_presence_of :title, :weight
belongs_to :dimention
end
