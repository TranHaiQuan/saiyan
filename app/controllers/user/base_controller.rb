class User::BaseController < ApplicationController
  layout "layouts/user/base"
  before_action :set_default_locale

  private
  def set_default_locale
    I18n.locale = :vi
  end
end
