class BasicDemographic < ActiveRecord::Base
  belongs_to :patient

  enum gender: [:male , :female]
  enum marital_status: [:single ,:married ,:separated ,:divorced ,:widowed]

  validates :interview_date, presence: true
end
