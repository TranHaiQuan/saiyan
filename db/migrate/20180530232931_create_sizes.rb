class CreateSizes < ActiveRecord::Migration[5.1]
  def change
    create_table :sizes do |t|
      t.integer :product_id
      t.string :name
      t.string :detail
      t.datetime :deteled_at

      t.timestamps
    end
  end
end
