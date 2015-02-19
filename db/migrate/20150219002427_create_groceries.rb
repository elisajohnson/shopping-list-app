class CreateGroceries < ActiveRecord::Migration
  def change
    create_table :groceries do |t|
      t.string :groceries
      t.integer :qty
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :groceries, :users
  end
end
