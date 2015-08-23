# == Schema Information
#
# Table name: patients
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Patient < ActiveRecord::Base
	has_many :registrations
	has_many :tasks
	has_one :abusing_profile
	has_one :basic_demographic
	has_one :treatment_history
	# has_one :riskey_behavior_profile


	validates :last_name, presence: true
	validates :last_name, presence: true

	#Create Registration for User and all passed clinic_ids.
	def update_clinics(clinic_ids, user)
		clinic_ids.each do |clinic_id|
			clinic = Clinic.find(clinic_id)
			reg = Registration.new
			reg.clinic = clinic
			reg.user = user
			reg.patient = self
			reg.save
		end
	end

	#Check if user has access to all clinic_ids?
	def check_clinics(clinic_ids, user)
		unless clinic_ids && !clinic_ids.empty?
			return false
		end
		clinic_ids.each do |clinic_id|
			clinic = Clinic.find(clinic_id)
			unless user.related_clinics.include?(clinic)
				return false
			end
		end
		return true
	end

	#Return combination of first and last name.
	def name
		return first_name + " " + last_name
	end
end
