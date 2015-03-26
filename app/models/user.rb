class User < ActiveRecord::Base
validates_presence_of :name, :email, :permission
validates_uniqueness_of :email

belongs_to :company
has_many :amt_comments

has_secure_password

end
