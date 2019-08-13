class UsersController < ApplicationController
  
  before_action :authenticate_user!, only: [:show]
  before_action :user_signed_in?, only: [:show]

  def show
  	puts "#"*60
  	puts params
  	puts "#"*60
  	@user = current_user
  end

  def edit
  	
  end

  def update
  	
  end

end
