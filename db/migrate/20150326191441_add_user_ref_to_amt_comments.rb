class AddUserRefToAmtComments < ActiveRecord::Migration
  def change
    add_reference :amt_comments, :user, index: true
  end
end
