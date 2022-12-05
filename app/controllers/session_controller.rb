class SessionController < ApplicationController
  skip_before_action :require_login, only: %i[login create]
  before_action :not_found, only: [:create]
  def login
  end

  def create
    user = User.find_by_username(params[:username])
    if user&.authenticate(params[:password])
      sign_in user
      redirect_to root_path
    else
      redirect_to session_login_path
    end
  end

  def logout
    sign_out
    redirect_to session_login_url
  end

  private
  
  def not_found
    if !User.find_by_username(params[:username])
      flash[:error] = 'Ошибка: пользователь не найден.'
      redirect_to session_login_path
    elsif !User.find_by_username(params[:username]).authenticate(params[:password])
      flash[:error] = 'Ошибка: неверный пароль.'
      redirect_to session_login_path
    end
  end

end
