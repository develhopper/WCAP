class Ddt < ActiveRecord::Base
	acts_as :test
	has_many :ddt_answers
  after_create :build_ddt_answers

  def build_ddt_answers
    DdtQuestion.all.each do |question|
      answer = DdtAnswer.new
      ddt_answers << answer
      answer.ddt_question = question
      answer.save
    end 
  end
end
