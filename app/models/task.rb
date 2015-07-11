class Task < ActiveRecord::Base
  belongs_to :study
  belongs_to :patient
end
