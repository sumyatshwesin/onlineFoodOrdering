class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :image
      t.text :category
      t.integer :delivery_fee
      t.timestamps
    end
  end
end
