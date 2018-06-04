class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :category_id
      t.integer :sub_category_id
      t.string :name
      t.text :description
      t.integer :quantity
      t.integer :sold_quantity
      t.integer :price
      t.integer :old_price
      t.integer :sale
      t.integer :waranty_time
      t.string :origin
      t.string :brand_name
      t.string :attach
      t.string :creater
      t.string :updater
      t.integer :status_id

      t.timestamps
    end
    add_index :products, :name, unique: true
  end
end
