class AbusingProfile < ActiveRecord::Base
  belongs_to :patient
  has_many :abusings
end
