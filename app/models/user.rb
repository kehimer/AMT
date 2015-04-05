class User < ActiveRecord::Base
validates_presence_of :name, :email, :permission
validates_uniqueness_of :email

belongs_to :company
has_many :amt_comments

has_secure_password

def self.permission_get
  ["Admin", "Type1", "Type2"]
end

end
