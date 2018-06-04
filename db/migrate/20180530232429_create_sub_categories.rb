class CreateSubCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_categories do |t|
      t.integer :category_id
      t.string :name
      t.string :avatar
      t.integer :status_id
      t.string :creater
      t.string :updater
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :sub_categories, :name, unique: true
  end
end
