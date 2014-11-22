class SessionsController < ApplicationController

  before_action :redirect_if_already_logged, only: :new

  def new
  end

  def create
    user = User.find_by(name: params[:name])

    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to shares_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  private

    def redirect_if_already_logged
      if User.find_by(id: session[:user_id])
        redirect_to shares_url
      end
    end
end
