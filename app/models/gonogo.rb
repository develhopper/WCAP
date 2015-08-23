# == Schema Information
#
# Table name: gonogos
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  finished   :boolean          default(FALSE), not null
#

class Gonogo < ActiveRecord::Base
	acts_as :test
	has_many :rectangles
  
  #Create an instance of Gonogo and also some Rectangles
  def create_one(test_detail)
    j= test_detail.part_count - 1
    for i in 0..j
        rectangle = Rectangle.new
        rectangles << rectangle
        rectangle.gonogo = self
        rectangle.save
    end 
  end
end
