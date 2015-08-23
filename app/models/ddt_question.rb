# == Schema Information
#
# Table name: ddt_questions
#
#  id               :integer          not null, primary key
#  definite_value   :integer          not null
#  indefinite_value :integer          not null
#  risk_rate        :integer          not null
#  question_type    :integer          not null
#  created_at       :datetime
#  updated_at       :datetime
#

class DdtQuestion < ActiveRecord::Base
	has_many :ddt_answers
	has_and_belongs_to_many :studies, join_table: :contact_plans_contact_types
	enum question_type: [:deterministic , :probabilistic]

  validates :definite_value, presence: true
  validates :indefinite_value, presence: true
  validates :risk_rate, presence: true
  validates :question_type, presence: true
end
