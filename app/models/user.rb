class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  acts_as_paranoid

  enum gender_id: {male: 1, female: 2}

  validates :name, uniqueness: {case_sensitive: false}
end
