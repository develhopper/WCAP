class DdtQuestion < ActiveRecord::Base
	has_many :ddt_answers
	has_and_belongs_to_many :studies
	enum question_type: [:deterministic , :probabilistic]
end
