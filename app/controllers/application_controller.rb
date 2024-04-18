class ApplicationController < ActionController::Base

  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user! , except: [:top]# 追加

  skip_before_action :authenticate_user!, only: %i[top]

  protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
  end


  def after_sign_out_path_for(resource_or_scope)
    root_path
  end


end
