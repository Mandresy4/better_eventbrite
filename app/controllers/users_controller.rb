class UsersController < ApplicationController
  
  # before_action :authenticate_user!, only: [:show]
  # before_action :connected_user, only: [:show]

  def show
  	puts "#"*60
  	puts params
  	puts "#"*60
  	@user = current_user
  end

  def destroy
  	puts "#"*60
  	puts params
  	puts "#"*60
  end

  private

  def connected_user
  	unless current_user == @user = User.find(params[:id])
  		flash[:danger] = "Tu n'as pas le droit d'aller sur ce profil!"
      redirect_to events_path
    end
  end
  
end
