class Gonogo < ActiveRecord::Base
	acts_as :test
	has_many :rectangles
end
