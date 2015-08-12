class Ddt < ActiveRecord::Base
	acts_as :test
	has_many :ddt_answers

  def create_one(test_detail)
    test_detail.study.ddt_questions.each do | ddt_question|
      answer = DdtAnswer.new
      ddt_answers << answer
      answer.ddt_question = ddt_question
      answer.save
    end
  end
end
