class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :registrations
  has_many :clinics
  has_many :studies
  belongs_to :current_study, :class_name => :Study ,:foreign_key => "current_study_id"
  belongs_to :current_task, :class_name => :Task ,:foreign_key => "current_task_id"
  has_and_belongs_to_many :studies
  has_and_belongs_to_many :clinics
end
