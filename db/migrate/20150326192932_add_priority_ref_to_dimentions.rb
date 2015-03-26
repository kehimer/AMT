class AddPriorityRefToDimentions < ActiveRecord::Migration
  def change
    add_reference :dimentions, :priorities, index: true
  end
end
