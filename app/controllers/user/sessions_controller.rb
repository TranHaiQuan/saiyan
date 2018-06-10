class User::SessionsController < Devise::SessionsController
  layout "/user/unauthenticated"
  include Accessible
  skip_before_action :check_user
end
