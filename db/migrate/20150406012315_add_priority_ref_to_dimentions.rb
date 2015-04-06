class AddPriorityRefToDimentions < ActiveRecord::Migration
  def change
    add_reference :dimentions, :priority, index: true
  end
end
