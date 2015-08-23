class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
    if params[:approved] == "false"
      @users = User.where(:approved => false)
    else
      @users = User.all
    end
  end

  #Approves User
  def approve
    user = User.find(params[:id])
    user.approved = true
    user.save
    redirect_to users_path
  end

  #Disapproves User
  def disapprove
    user = User.find(params[:id])
    user.approved = false
    user.save
    redirect_to users_path
  end

end