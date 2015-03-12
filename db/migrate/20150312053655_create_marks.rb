class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.datetime :date
      t.references :goal, index: true
      t.integer :value

      t.timestamps null: false
    end
    add_foreign_key :marks, :goals
  end
end
