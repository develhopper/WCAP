class Abusing < ActiveRecord::Base
  belongs_to :abusing_profile

  enum drug_type: [:opium, :heroin, :crack, :norgesic,
   :buprenorphine, :other_opiums, :methamphetamine,
	 :ecstasy, :cocaine, :hallucinogens, :hashish, :sedative,
	 :alcohol, :cigarette, :other_materials]
  enum abusing_type: [:nasal, :fumigation, :orally, :non_intravenous_injection, 
	 :intravenous_injection]
end
