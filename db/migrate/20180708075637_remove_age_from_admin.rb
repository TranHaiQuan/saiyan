class RemoveAgeFromAdmin < ActiveRecord::Migration[5.1]
  def change
    remove_column :admins, :age, :integer
  end
end
