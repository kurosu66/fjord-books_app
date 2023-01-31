class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def index
    @users = User.page(params[:page]).order(id: :asc)
  end

  def show; end

  def edit; end

  def update
    User.find(params[:id]).update(user_params)
    # redirectを指定する
    redirect_to @user, notice: t('controllers.common.notice_update', name: User.model_name.human)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :postal_code, :address, :introduction)
  end
end

