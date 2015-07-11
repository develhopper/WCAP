class DdtAnswer < ActiveRecord::Base
  belongs_to :ddt
  belongs_to :ddt_question
end
