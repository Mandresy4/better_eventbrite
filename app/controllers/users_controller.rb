class UsersController < ApplicationController
  
   before_action :authenticate_user!, only: [:show, :edit, :update]

  def show
  	puts "#"*60
  	puts params
  	puts "#"*60
  	@user = current_user
    @events = @user.admins
  end

  def edit
    # @user = User.find(params[:id])
    
  end

  def update
  	
  end

end
