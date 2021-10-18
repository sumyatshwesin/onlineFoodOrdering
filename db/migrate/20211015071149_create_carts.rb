class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.references :menu, null: false, foreign_key: true
      t.integer :quantity
      t.integer :price
      t.timestamps
    end
  end
end
