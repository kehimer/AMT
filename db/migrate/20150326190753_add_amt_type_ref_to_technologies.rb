class AddAmtTypeRefToTechnologies < ActiveRecord::Migration
  def change
    add_reference :technologies, :amt_type, index: true
  end
end
