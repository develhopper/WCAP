class Gonogo < ActiveRecord::Base
	acts_as :test
	has_many :rectangles
  
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
