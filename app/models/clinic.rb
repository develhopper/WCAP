# == Schema Information
#
# Table name: clinics
#
#  id            :integer          not null, primary key
#  name          :string(255)      not null
#  supervisor_id :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#

class Clinic < ActiveRecord::Base
  belongs_to :supervisor, :class_name => :User,:foreign_key => "supervisor_id"
  has_many :registrations
  has_and_belongs_to_many :users

  
  #Validates presence of :name
  validates :name, presence: true

end
