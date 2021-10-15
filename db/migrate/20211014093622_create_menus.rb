class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.string :name
      t.string :image
      t.text :description
      t.integer :price
      t.timestamps
    end
  end
end
