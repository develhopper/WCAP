# == Schema Information
#
# Table name: barts
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  finished   :boolean          default(FALSE), not null
#

class Bart < ActiveRecord::Base
	acts_as :test
	has_many :balloons


  #Creates an instance of Bart and also creates Balloons
  def create_one(test_detail)
    j= test_detail.part_count - 1
    for i in 0..j
        balloon = Balloon.new
        balloons << balloon
        balloon.bart = self
        balloon.save
    end
  end
end
