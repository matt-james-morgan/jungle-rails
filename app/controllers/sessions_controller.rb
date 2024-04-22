class SessionsController < ApplicationController
  def new
  end

  def create
    # @user = User.find_by(email: params[:session][:email].downcase)
    
    if @user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  
end
