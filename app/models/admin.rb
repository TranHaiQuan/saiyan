class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  enum gender_id: {male: 1, female: 2}

  validates :name, :address, :phone_number, presence: true
  validates :phone_number, numericality: {only_integer: true}
  validates :birthday, valid_date: true, presence: true
  validates :email, presence: true, format_rule: true, uniqueness: {case_sensitive: false}
  attr_accessor :skip_password_validation

  ADMIN_ATTRIBUTES = [
    :email, :name, :birthday, :gender_id, :address, :phone_number
  ]

  def self.option_for_gender_id
    self.gender_ids.keys.map{|key, _| [I18n.t("admin.info.gender_ids.#{key}"), key]}
  end

  private
  def password_required?
    !skip_password_validation
  end
end
