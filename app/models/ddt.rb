# == Schema Information
#
# Table name: ddts
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  finished   :boolean          default(FALSE), not null
#

class Ddt < ActiveRecord::Base
	acts_as :test
	has_many :ddt_answers

  #Creates an instance of Ddt and creates DdtAnswer for related DdtQuestions.
  def create_one(test_detail)
    test_detail.study.ddt_questions.each do | ddt_question|
      answer = DdtAnswer.new
      ddt_answers << answer
      answer.ddt_question = ddt_question
      answer.save
    end
  end
end
