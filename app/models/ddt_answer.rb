# == Schema Information
#
# Table name: ddt_answers
#
#  id              :integer          not null, primary key
#  ddt_id          :integer          not null
#  ddt_question_id :integer          not null
#  response        :boolean          default(FALSE), not null
#  created_at      :datetime
#  updated_at      :datetime
#

class DdtAnswer < ActiveRecord::Base
  belongs_to :ddt
  belongs_to :ddt_question
  
  #Validates presence of [:ddt, :ddt_question]
  validates :ddt_question, presence: true

end
