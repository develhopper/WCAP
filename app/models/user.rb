# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  current_study_id       :integer
#  admin                  :boolean          default(FALSE), not null
#  current_task_id        :integer
#  approved               :boolean          default(FALSE), not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :build_profile

  #Build profile after creation
  def build_profile
    Profile.create(user: self) # Associations must be defined correctly for this syntax, avoids using ID's directly.
  end

  

  #Returns combination of email address and Profile name
  def identity
    "#{email}  #{profile.name} "
  end

  has_one :profile
  has_many :registrations
  has_many :under_supervision_clinics, :class_name => :Clinic, :foreign_key => "supervisor_id"
  has_many :under_supervision_studies, :class_name => :Study, :foreign_key => "admin_id"
  belongs_to :current_study, :class_name => :Study ,:foreign_key => "current_study_id"
  belongs_to :current_task, :class_name => :Task ,:foreign_key => "current_task_id"
  has_and_belongs_to_many :studies
  has_and_belongs_to_many :clinics



  #Returns under supervision clinics and examining clinics
  def related_clinics
    _clinics = []
    under_supervision_clinics.each do |c|
      unless _clinics.include?(c)
        _clinics.append(c)
      end
    end
    clinics.each do |c|
      unless _clinics.include?(c)
        _clinics.append(c)
      end
    end
    return _clinics
  end

  #Returns all patient in under supervision clinics or patient which has registered by user.
  def related_patients
    _patients=[]
    under_supervision_clinics.each do |clinic|
      clinic.registrations.each do |reg|
        unless _patients.include?(reg.patient)
          _patients.append(reg.patient)
        end
      end
    end

    registrations.each do |reg|
      unless _patients.include?(reg.patient)
        _patients.append(reg.patient)
      end
    end
    return _patients
  end

  #Returns all under supervision Studies plus related Studies.
  def related_studies
    _studies = []
    under_supervision_studies.each do |study|
      unless _studies.include?(study)
        _studies.append(study)
      end
    end
    studies.each do |study|
      unless _studies.include?(study)
        _studies.append(study)
      end
    end
    return _studies
  end

  #Returns true if User has at least one related Patient
  def has_related_patient?
    if registrations.count > 0
      return true
    end
    under_supervision_clinics.each do |clinic|
      clinic.registrations.each do |reg|
        return true
      end
    end
    return false
  end

  #Returns true if User has at least one related Clinic
  def has_related_clinics?
    if under_supervision_clinics.count > 0 || clinics.count > 0
      return true
    end
    return false
  end

  #Returns true if User is a supervisor of at least one Clinic
  def is_supervisor?
    not under_supervision_clinics.empty?
  end

  #Returns true if User has access to Patient
  def can_edit_patient(patient_id)
    patient = Patient.find(patient_id)
    if patient 
      patient.registrations.each do | registration | 
        if registration.clinic.supervisor == self || registration.user == self
          return true
        end
      end
    end
    return false
  end


  #Returns true if User has access to Study
  def can_edit_study(study_id)
    study = Study.find(study_id)
    if study 
      if study.admin == self
        return true
      end
      study.users.each do | user | 
        if user == self
          return true
        end
      end
    end
    return false
  end


  #Returns true if user is approved or is admin (devise overrides)
  def active_for_authentication? 
    super && (approved? || self.admin) 
  end 

  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end
end
