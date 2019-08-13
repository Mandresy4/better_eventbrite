class Event < ApplicationRecord

	belongs_to :admin, class_name: "User"
	has_many :attendances
	has_many :users, through: :attendances

	validates :start_date, presence: true

	validates :duration, presence: true, numericality: { greater_than: 0 }

	validates :title, presence: true 
	# length: { in: 5..140 }

	validates :description, presence: true
	# , length: { in: 20..1000 }

	validates :price, presence: true
	# , numericality: { in: 1..1000 }

	validates :location, presence: true

	validate :multiple_of_5?
	validate :start_date_good?

	private

	def start_date_good?
		if start_date > Time.now
			true
		else
			errors.add(:start_date, "Ton event doit être dans le futur!")	
		end
	end

	def multiple_of_5?
		if duration%5 != 0
			errors.add(:duration, "La durée doit être un multiple de 5")
		end
	end


end
