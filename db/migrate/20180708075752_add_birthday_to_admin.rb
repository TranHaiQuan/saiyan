class AddBirthdayToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :birthday, :datetime
  end
end
