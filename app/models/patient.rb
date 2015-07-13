class Patient < ActiveRecord::Base
	has_many :registrations
	has_many :tasks
	has_one :abusing_profile
	has_one :basic_demographic
	has_one :treatment_history
	# has_one :riskey_behavior_profile
end
