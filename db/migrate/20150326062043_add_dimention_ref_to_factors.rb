class AddDimentionRefToFactors < ActiveRecord::Migration
  def change
    add_reference :factors, :dimention, index: true
  end
end
