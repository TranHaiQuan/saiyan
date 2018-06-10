class Admin::BaseController < ApplicationController
  layout "layouts/admin/base"
  before_action :authenticate_admin!
  before_action :set_default_locale

  private
  def set_default_locale
    I18n.locale = :vi
  end
end
