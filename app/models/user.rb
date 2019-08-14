class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	# after_create :welcome_send

	# has_many :events, foreign_key: 'admin_id'
	has_many :attendances
	has_many :events, through: :attendances
	has_many :admins, foreign_key: 'admin_id', class_name: 'Event', dependent: :destroy

	# def welcome_send
 #    UserMailer.welcome_email(self).deliver_now
 #  end

 	#  def authenticate_current_user
  #   @user = User.find(params[:id])
  #   unless current_user == @user
  #     flash[:danger] = "Impossible d'aller sur cette page."
  #     redirect_to root_path
  #   end
  # end

end
