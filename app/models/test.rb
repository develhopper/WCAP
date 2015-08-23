# == Schema Information
#
# Table name: tests
#
#  id                 :integer          not null, primary key
#  task_id            :integer          not null
#  execution_schedule :integer
#  actable_id         :integer
#  actable_type       :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class Test < ActiveRecord::Base
  actable
  
  belongs_to :task

  enum execution_schedule: [:before_stimulation, 
  	:after_stimulation , :during_stimulation]

  validates :task, presence: true


  #Return list of child class of Test for example: [Bart, Gonogo, ..]
  def self.get_child_classes
    result = []
    classes = ActiveRecord::Base.connection.tables.map do |model|
      model.capitalize.singularize.camelize
    end
    classes.each do |clazz|
      begin 
        if clazz.constantize.acting_as?
          if clazz.constantize.acting_as_model.name == Test.name
            result.append(clazz)
          end
        end
      rescue NameError => e
      end
    end
    return result
  end
end
