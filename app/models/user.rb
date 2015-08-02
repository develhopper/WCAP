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
end
