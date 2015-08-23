# == Schema Information
#
# Table name: abusings
#
#  id                        :integer          not null, primary key
#  abusing_profile_id        :integer          not null
#  drug_type                 :integer
#  first_use_age             :integer
#  continuous_usage_duration :integer
#  count                     :integer
#  abusing_type              :integer
#  description               :text
#  is_mainspring             :boolean          default(FALSE), not null
#  created_at                :datetime
#  updated_at                :datetime
#

class Abusing < ActiveRecord::Base
  belongs_to :abusing_profile

  enum drug_type: [:opium, :heroin, :crack, :norgesic,
   :buprenorphine, :other_opiums, :methamphetamine,
	 :ecstasy, :cocaine, :hallucinogens, :hashish, :sedative,
	 :alcohol, :cigarette, :other_materials]
  enum abusing_type: [:nasal, :fumigation, :orally, :non_intravenous_injection, 
	 :intravenous_injection]


   validates :abusing_type, presence: true
   validates :drug_type, presence: true
end
