class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def index
    @users = User.page(params[:page]).order(id: :asc)
  end

  def show; end

  def edit; end

  def update

  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end

