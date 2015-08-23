# == Schema Information
#
# Table name: registrations
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  clinic_id  :integer          not null
#  patient_id :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Registration < ActiveRecord::Base
  belongs_to :user
  belongs_to :clinic
  belongs_to :patient

  validates :user, presence: true
  validates :clinic, presence: true
  validates :patient, presence: true
end
