class Stroop < ActiveRecord::Base
	acts_as :test

  def create_one(test_detail)
    self.total_items = test_detail.part_count * 4
  end
end
