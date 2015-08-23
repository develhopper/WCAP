# == Schema Information
#
# Table name: basic_demographics
#
#  id               :integer          not null, primary key
#  patient_id       :integer          not null
#  file_number      :integer
#  private_code     :integer
#  gender           :integer
#  year_of_birth    :integer
#  interview_date   :date
#  marital_status   :integer
#  educational_year :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class BasicDemographic < ActiveRecord::Base
  belongs_to :patient

  enum gender: [:male , :female]
  enum marital_status: [:single ,:married ,:separated ,:divorced ,:widowed]

  validates :patient, presence: true
  validates :gender, presence: true
  validates :interview_date, presence: true
  validates :marital_status, presence: true
end
