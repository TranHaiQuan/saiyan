class Admin::SessionsController < Devise::SessionsController
  layout "/admin/unauthenticated"
  include Accessible
  skip_before_action :check_user
end
