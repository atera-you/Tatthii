class SessionsController < ApplicationController
  def new
  end

  def create
    if auth_params
      user = User.find_or_create_from_auth(auth_params)
      log_in user
      flash[:success]= "Login completed"
      redirect_back_or root_path
    else
      user = User.find_by(email: params[:session][:email].downcase)
      if user&& user.authenticate(params[:session][:password])
        log_in user
        params[:session][:remember_me] == '1'? remember(user):forget(user)
        flash[:success]= "Login completed"
        redirect_back_or user
      else
        flash.now[:danger] = 'invalid email/password combination'
        render 'new'
      end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
  def auth_params
    request.env['omniauth.auth']
  end
end
