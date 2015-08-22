class Study < ActiveRecord::Base
  belongs_to :admin , :class_name => :User
  has_many :test_details
  has_and_belongs_to_many :users
  has_and_belongs_to_many :ddt_questions, :join_table => :ddt_questions_studies
  has_many :tasks

  def patients
    patients = []
    tasks.each do |task|
      patients.append(task.patient)
    end
    return patients
  end

  def create_task(patient)
    t = Task.new
    test_details.each do |tdetail|
      test = tdetail.name.constantize.new
      test.create_one(tdetail)
      t.tests << test
      test.save
    end
    t.patient = patient
    t.save
    self.tasks.append(t)
  end
end
