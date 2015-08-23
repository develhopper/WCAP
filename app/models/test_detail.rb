# == Schema Information
#
# Table name: test_details
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  part_count :integer
#  study_id   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class TestDetail < ActiveRecord::Base
  belongs_to :study

  validates :name, presence: true
  validates :study, presence: true
end
