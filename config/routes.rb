Rails.application.routes.draw do
  constraints subdomain: /(admin|staff)/ do
    constraints subdomain: /^admin/ do
      defaults subdomain: Settings.domain.admin do
        # root to
      end

      scope "/:locale", constraints: LocaleConstraint do
        constraints subdomain: /^staff/ do
          defaults subdomain: Settings.domain.staff do
            # root to
          end
        end
      end
    end
  end

  constraints CustomerConstraint do
    # root to

    scope "(:locale)", locale: /#LocaleConstraint::ACCEPT_LANGUAGES.join("|")}/ do
      # root to
    end
  end
end
