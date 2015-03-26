class AddFactorRefToTechnologies < ActiveRecord::Migration
  def change
    add_reference :technologies, :factor, index: true
  end
end
