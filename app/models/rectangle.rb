# == Schema Information
#
# Table name: rectangles
#
#  id            :integer          not null, primary key
#  state         :integer
#  is_clicked    :boolean
#  display_time  :integer
#  response_time :integer
#  gonogo_id     :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#

class Rectangle < ActiveRecord::Base
  belongs_to :gonogo

  enum state: [:blue_vertical, :green_vertical, :blue_horizontal, :green_horizontal]

  #Validates presence of :gonogo
  validates :gonogo, presence: true
end
