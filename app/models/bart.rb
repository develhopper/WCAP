class Bart < ActiveRecord::Base
	acts_as :test
	has_many :balloons
	after_create :make_balloons

  	def make_balloons
    	for i in 0..4
	      balloon = Balloon.new
	      balloons << balloon
	      balloon.bart = self
	      balloon.save
		end   
   	end

end
