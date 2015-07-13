class Study < ActiveRecord::Base
  belongs_to :admin , :class_name => :User
  has_many :test_details
  has_and_belongs_to_many :users
  has_and_belongs_to_many :ddt_questions
end
