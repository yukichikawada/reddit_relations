class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user
      login(user)
      render plain: 'Good job'
    else
      flash[:errors] = ["Invalid creds"]
      render plain: 'Bad job'
    end
  end
end
