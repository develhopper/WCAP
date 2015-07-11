class Test < ActiveRecord::Base
  actable
  
  belongs_to :task
end
