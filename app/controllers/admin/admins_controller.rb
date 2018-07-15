class Admin::AdminsController < Admin::BaseController
  def index
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new admin_params
    status = @admin.save
    flash[:success] = "Tạo thành công!" if status

    render json: {
      status: status,
      errors: @admin.errors.to_json,
      redirect_path: admins_admins_path
    }
  end

  private
  def admin_params
    params.require(:admin).permit(Admin::ADMIN_ATTRIBUTES).merge skip_password_validation: true
  end
end
