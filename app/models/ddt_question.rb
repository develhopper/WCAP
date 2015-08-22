class DdtQuestion < ActiveRecord::Base
	has_many :ddt_answers
	has_and_belongs_to_many :studies, :join_table => :ddt_questions_studies
	enum question_type: [:deterministic , :probabilistic]
end
