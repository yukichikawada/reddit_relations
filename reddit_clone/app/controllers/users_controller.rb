class UsersController < ApplicationController

  def create
    user = User.new(user_params)

    if user.save
      login(user)
      # redirect to subs_url
      render plain: 'Good job'
    else
      flash[:errors] = user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
