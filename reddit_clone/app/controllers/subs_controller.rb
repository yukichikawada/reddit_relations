class SubsController < ApplicationController
  # before_action :require_login

  def new
  end

  def create
    cat = Sub.new(sub_params)
    cat.moderator = current_user.id

    if cat.save
      redirect_to sub_url(cat)
    else
      flash[:errors] = cat.errors.full_messages
      render :new
    end
  end

  def index
    @cats = Sub.all
  end

  def update
  end

  def edit
  end

  def show
    @cat = Sub.find(params[:id])
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
