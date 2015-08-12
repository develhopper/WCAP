class Gonogo < ActiveRecord::Base
	acts_as :test
	has_many :rectangles
	after_create :make_rectangles

  	def make_rectangles
    	for i in 0..9
	      rectangle = Rectangle.new
	      rectangles << rectangle
	      rectangle.gonogo = self
	      rectangle.save
		end   
   	end

end
