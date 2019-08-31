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
    UserInformation.new(user_id: 1)
  end

  def set_user
    @user = User.find(1)
  end

end