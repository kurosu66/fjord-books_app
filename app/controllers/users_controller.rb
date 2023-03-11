# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def index
    @users = User.page(params[:page]).order(id: :asc)
  end

  def show; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :postal_code, :address, :introduction)
  end
end
