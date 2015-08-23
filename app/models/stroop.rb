# == Schema Information
#
# Table name: stroops
#
#  id            :integer          not null, primary key
#  duration      :integer
#  total_items   :integer
#  correct_items :integer
#  finished      :boolean          default(FALSE), not null
#  created_at    :datetime
#  updated_at    :datetime
#

class Stroop < ActiveRecord::Base
	acts_as :test

  #Create an instance of Stroop from test_detail.
  def create_one(test_detail)
    self.total_items = test_detail.part_count * 8
  end
end
