# == Schema Information
#
# Table name: treatment_histories
#
#  id                  :integer          not null, primary key
#  patient_id          :integer          not null
#  is_cured            :boolean
#  in_month_treated    :boolean
#  in_year_treat_count :integer
#  na_session          :boolean
#  total               :integer
#  created_at          :datetime
#  updated_at          :datetime
#

class TreatmentHistory < ActiveRecord::Base
  belongs_to :patient
  has_many :treatments

  validates :patient, presence: true
end
