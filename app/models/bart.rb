class Bart < ActiveRecord::Base
	acts_as :test
	has_many :balloons

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
