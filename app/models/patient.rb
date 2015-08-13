class Patient < ActiveRecord::Base
	has_many :registrations
	has_many :tasks
	has_one :abusing_profile
	has_one :basic_demographic
	has_one :treatment_history
	# has_one :riskey_behavior_profile

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

	def name
		return first_name + " " + last_name
	end
end
