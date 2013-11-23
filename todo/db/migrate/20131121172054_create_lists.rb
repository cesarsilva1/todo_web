class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.string :color
      t.boolean :shared
      t.references :user, index: true

      t.timestamps
    end
  end
end
