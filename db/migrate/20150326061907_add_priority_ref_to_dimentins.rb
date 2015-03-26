class AddPriorityRefToDimentins < ActiveRecord::Migration
  def change
    add_reference :dimentins, :priority, index: true
  end
end
