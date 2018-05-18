class Admin::BaseController < ApplicationController
  protect_from_forgery
  before_action :set_defalt_locale

  private
  def set_defalt_locale
    I18n.locale = :vi
  end
end
