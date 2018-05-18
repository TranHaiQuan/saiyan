class BaseController < ApplicationController
  def subdomain_redirect
    case request.subdomain
    when Settings.domain.staff
      redirect_to staff_root_path locale: LocaleConstraint::DEFAULT_LANGUAGE
    else
      redirect_to root_path locale: LocaleConstraint::DEFAULT_LANGUAGE
    end
  end
end
