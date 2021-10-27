class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.references :menu, null: false, foreign_key: true
      t.integer :quantity
      t.integer :price
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
