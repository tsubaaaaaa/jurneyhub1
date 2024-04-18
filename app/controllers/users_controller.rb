class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end


  def mymap
    @user = User.find(params[:id])
  end


end
