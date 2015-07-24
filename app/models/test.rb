class Test < ActiveRecord::Base
  actable
  
  belongs_to :task

  enum execution_schedule: [:before_stimulation, 
  	:after_stimulation , :during_stimulation]
end
