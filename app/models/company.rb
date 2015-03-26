class Company < ActiveRecord::Base
validates_presence_of :name, :city

has_many :users
has_many :survey_results

end
