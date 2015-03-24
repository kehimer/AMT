class CreateTechnologies < ActiveRecord::Migration
  def change
    create_table :technologies do |t|
      t.text :title
      t.text :description
      t.text :benefits
      t.text :others
      t.text :summary
      t.integer :weight

      t.timestamps
    end
  end
end
