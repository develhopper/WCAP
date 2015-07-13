class Ddt < ActiveRecord::Base
	acts_as :test
	has_many :ddt_answers
end
