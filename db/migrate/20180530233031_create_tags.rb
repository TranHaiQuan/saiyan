class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.integer :product_id
      t.string :name
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
