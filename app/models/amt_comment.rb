class AmtComment < ActiveRecord::Base
validates_presence_of :comment
belongs_to :technology
belongs_to :user

def decorate_created_at
  if self.created_at.present?
    self.created_at.strftime("%e %b %Y")
  end
end

def decorate_created_at
  if self.user.present?
    self.created_at.strftime("%e %b %Y")
  end
end

end
