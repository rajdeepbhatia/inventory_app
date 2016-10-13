class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by(id: params[:id])
    flash[:error] = t('users.error.not_found') and return if @user.blank?
  end
end
