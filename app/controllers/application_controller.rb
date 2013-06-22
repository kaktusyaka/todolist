class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  protected
  def layout_by_resource
    if devise_controller?
      "layout_name_for_devise"
    else
      "application"
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
