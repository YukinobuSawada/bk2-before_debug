class ApplicationController < ActionController::Base
	
	before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
  def authenticate_user 
  if session[:user_id] == nil #ログインしていない場合
    flash[:notice] = "ログインが必要です" #フラッシュを表示
    redirect_to new_user_session_path#ログイン画面にリダイレクト
  end
  end
end
