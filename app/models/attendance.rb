class Attendance < ApplicationRecord

	after_create :attendance_subs_mail_send

  def attendance_subs_mail_send
    AdminEventMailer.attendance_subs_mail(self).deliver_now
  end

	belongs_to :user
	belongs_to :event
end
