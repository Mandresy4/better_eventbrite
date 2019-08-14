class UsersController < ApplicationController
  
   before_action :authenticate_user!, only: [:show, :edit, :update]
   before_action :user_signed_in?, except: [:show]
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
    @user = User.find(params[:id])

    if @user.update(first_name:params[:first_name], last_name:params[:last_name], description:params[:description])

        flash[:success] = "Ton profil a été édité!"
        redirect_to user_path(@user.id)
    else
      render :edit
    end
  	
  end

end
