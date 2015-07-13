class Task < ActiveRecord::Base
  belongs_to :study
  belongs_to :patient
  has_many :tests
end
