# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
require 'pry'


User.destroy_all
Event.destroy_all
Attendance.destroy_all


30.times do


	first_name = Faker::Name.first_name
	last_name = Faker::Name.last_name
	email = "#{first_name.downcase}.#{last_name.downcase}@yopmail.com"
	User.create(
		first_name:first_name,
		last_name:last_name,
		email:email,
		description:Faker::Quote.matz,
		password:Faker::Internet.password(min_length: 8)
		)

end


6.times do
	
duration = [30, 40, 90, 75]

	e = Event.new(
		start_date:Faker::Date.between(from: Date.today, to: 2.month.from_now).to_datetime,
		duration:duration.sample,
		title:Faker::Quote.robin,
		description:Faker::Quote.matz,
		price:rand(20..100),
		location:Faker::Address.city,
		admin:User.all.sample
		)
	
	e.save
	
end


40.times do
    a = Attendance.new(user: User.all.sample, event: Event.all.sample)
    until a.save
        a = Attendance.new(user: User.all.sample, event: Event.all.sample)
    end
end

