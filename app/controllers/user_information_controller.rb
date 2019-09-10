class UserInformationController < ApplicationController
  before_action :set_user

  def new
    @user_information = new_with
  end

  def create

  end

  def edit

  end

  def update

  end

  private
  def new_with
    UserInformation.new(user_id: current_user.id)
  end

  def set_user
    @user = User.find(current_user.id)
  end

end