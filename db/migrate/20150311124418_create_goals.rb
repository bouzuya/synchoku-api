class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.datetime :date
      t.string :token
      t.integer :value
      t.boolean :visible

      t.timestamps null: false
    end
  end
end
