# == Schema Information
#
# Table name: balloons
#
#  id            :integer          not null, primary key
#  pumps         :integer
#  explosion     :boolean
#  response_time :integer
#  bart_id       :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#

class Balloon < ActiveRecord::Base
  belongs_to :bart

  #Validates presence of :bart
  validates :bart, presence: true
end
