class AddTechnologyRefToAmtComments < ActiveRecord::Migration
  def change
    add_reference :amt_comments, :technology, index: true
  end
end
