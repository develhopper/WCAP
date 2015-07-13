class Bart < ActiveRecord::Base
	acts_as :test
	has_many :balloons
end
