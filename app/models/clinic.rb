class Clinic < ActiveRecord::Base
  belongs_to :supervisor, :class_name => :User,:foreign_key => "supervisor_id"
  has_many :registrations
  has_and_belongs_to_many :users
end
