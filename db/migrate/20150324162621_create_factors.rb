class CreateFactors < ActiveRecord::Migration
  def change
    create_table :factors do |t|
      t.string :title
      t.integer :weight

      t.timestamps
    end
  end
end
