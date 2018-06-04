class Category < ApplicationRecord
  acts_as_paranoid

  validates :name, :avatar, :status_id, presence: true
  validates :name, uniqueness: {case_sensitive: false}
end
