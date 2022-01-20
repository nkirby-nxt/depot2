class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin_role

  private

  def require_admin_role
    unless current_user.admin?
      redirect_to store_index_path, notice: "Access denied."
    end
  end
end
