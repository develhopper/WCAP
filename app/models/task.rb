# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  study_id   :integer          not null
#  patient_id :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Task < ActiveRecord::Base
  belongs_to :study
  belongs_to :patient
  has_many :tests

  validates :study, presence: true
  validates :patient, presence: true
end
