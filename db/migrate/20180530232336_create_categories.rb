class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.integer :user_id
      t.string :name
      t.string :avatar
      t.text :description
      t.integer :status_id
      t.string :creater
      t.string :updater
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :categories, :name, unique: true
  end
end
