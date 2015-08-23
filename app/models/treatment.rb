# == Schema Information
#
# Table name: treatments
#
#  id                   :integer          not null, primary key
#  treatment_history_id :integer          not null
#  treatment_type       :integer
#  count                :integer
#  max_avoidance_day    :integer
#  description          :text
#  in_month_used        :integer
#  created_at           :datetime
#  updated_at           :datetime
#

class Treatment < ActiveRecord::Base
  belongs_to :treatment_history

  enum treatment_type: [:alternative_treatment_with_methadone,
   :alternative_treatment_with_bupernorphine,
   :treatment_with_naltrexone,
   :outpatient_detoxification,
   :detoxification_without_supervision_of_therapists,
   :inpatient_detoxification,
   :detoxification_under_anesthesia,
   :rehabilitation_care_in_therapeutic_community,
   :residential_treatment_is_abstinence,
   :treatment_admissions_for_stimulant_drugs,
   :psychological_and_outpatient_drug_treatment_for_stimulants,
   :other_methods
    ]
  validates :treatment_type, presence: true
end
