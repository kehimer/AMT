class CreateAmtComments < ActiveRecord::Migration
  def change
    create_table :amt_comments do |t|
      t.string :comment

      t.timestamps
    end
  end
end
