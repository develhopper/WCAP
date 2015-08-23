# == Schema Information
#
# Table name: abusing_profiles
#
#  id             :integer          not null, primary key
#  cost_per_month :integer
#  overdose_count :integer
#  freakout_count :integer
#  patient_id     :integer          not null
#  created_at     :datetime
#  updated_at     :datetime
#

class AbusingProfile < ActiveRecord::Base
  belongs_to :patient
  has_many :abusings

  #Validates presence of :patient
  validates :patient, presence: true
end
