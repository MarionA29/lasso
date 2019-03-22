class Admin::ApplicationController < ActionController::Base
  before_action :authenticate_user
  layout "admin_app"
  def authenticate_user
    if current_user == nil
      redirect_to new_user_session_path
    else
      @admin = User.find_by(email:"admin@lasso.com")
      if current_user.id != @admin.id
        redirect_to root_path
      end
    end
  end

  def index
  end
end
