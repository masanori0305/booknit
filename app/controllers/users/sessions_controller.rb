class Users::SessionsController < Devise::SessionsController
  # coding: utf-8

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path, :notice => 'サインインしました'
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path, :notice => ' サインアウトしました'
  end

  def oauth_failure
    redirect_to root_path, :notice => ' サインイン処理が中断されました'
  end

end
