module Multilanguage
  private
  def set_locale
    I18n.locale = params[:locale] || LocaleConstraint::DEFAULT_LANGUAGE
  end

  def default_url_options options = {}
    {locale: I18n.locale}.merge options
  end
end
