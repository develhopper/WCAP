class TreatmentHistory < ActiveRecord::Base
  belongs_to :patient
  has_many :treatments
end
