class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :build_profile

  def build_profile
    Profile.create(user: self) # Associations must be defined correctly for this syntax, avoids using ID's directly.
  end

  def is_supervisor
    not under_supervision_clinics.empty?
  end


  def identity
    "#{email}  #{profile.name} "
  end

  has_one :profile
  has_many :registrations
  has_many :under_supervision_clinics, :class_name => :Clinic, :foreign_key => "supervisor_id"
  has_many :studies
  belongs_to :current_study, :class_name => :Study ,:foreign_key => "current_study_id"
  belongs_to :current_task, :class_name => :Task ,:foreign_key => "current_task_id"
  has_and_belongs_to_many :studies
  has_and_belongs_to_many :clinics

  def related_clinics
    _clinics = []
    under_supervision_clinics.each do |c|
      _clinics.append(c)
    end
    clinics.each do |c|
      _clinics.append(c)
    end
    return _clinics
  end

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


  # devise overrides
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
