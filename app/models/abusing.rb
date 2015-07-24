class Abusing < ActiveRecord::Base
  belongs_to :abusing_profile

  enum drug_type: [:opium, :heroin, :crack, :norgesic,
   :Buprenorphine, :other_opiums, :methamphetamine,
	 :ecstasy, :cocaine, :hallucinogens, :hashish, :sedative,
	 :alcohol, :cigarette, :other_materials]
	enum type: [:nasal, :fumigation, :orally, :non_intravenous_injection, 
	 :intravenous_injection]
end
