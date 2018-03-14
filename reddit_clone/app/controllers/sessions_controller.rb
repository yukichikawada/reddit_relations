class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user
      login(user)
      redirect_to subs_url
    else
      flash[:errors] = ["Invalid creds"]
      render :new
    end
  end
end
