class CreateDos < ActiveRecord::Migration
  def change
    create_table :dos do |t|
      t.boolean :completed
      t.integer :priority
      t.string :details
      t.string :map
      t.datetime :date
      t.references :list, index: true

      t.timestamps
    end
  end
end
