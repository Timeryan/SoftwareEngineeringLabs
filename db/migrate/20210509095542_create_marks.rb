class CreateMarks < ActiveRecord::Migration[6.1]
  def change
    create_table :marks do |t|
      t.integer :points
      t.string :letter
      t.belongs_to :lab, foreign_key: true

      t.timestamps
    end
  end
end
