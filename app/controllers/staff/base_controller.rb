class Staff::BaseController < ApplicationController
  protect_from_forgery

  include Mltilanguage

  before_action :set_locale, default_url_options

end
