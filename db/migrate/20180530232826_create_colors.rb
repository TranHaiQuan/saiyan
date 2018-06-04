class CreateColors < ActiveRecord::Migration[5.1]
  def change
    create_table :colors do |t|
      t.integer :product_id
      t.string :name
      t.string :color_hex
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
