class CreateDimentions < ActiveRecord::Migration
  def change
    create_table :dimentions do |t|
      t.string :title
      t.integer :weight

      t.timestamps
    end
  end
end
