class CreateSharings < ActiveRecord::Migration
  def change
    create_table :sharings do |t|
      t.references :user, index: true
      t.references :list, index: true

      t.timestamps
    end
  end
end
