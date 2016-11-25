class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text :description
      t.string :state
      t.string :priority
      t.date :start
      t.date :finish
      t.integer :progress
      t.string :type
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
