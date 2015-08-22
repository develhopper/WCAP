class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    
    alias_action :update, :create, :read, :to => :safe_manage


    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else

        #
        # The first argument to `can` is the action you are giving the user
        # permission to do.
        # If you pass :manage it will apply to every action. Other common actions
        # here are :read, :create, :update and :destroy.
        #
        # The second argument is the resource the user can perform the action on.
        # If you pass :all it will apply to every resource. Otherwise pass a Ruby
        # class of the resource.
        #
        # The third argument is an optional hash of conditions to further filter the
        # objects.
        # For example, here the user can only update published articles.
        #
        #   can :update, Article, :published => true
        #
        # See the wiki for details:
        # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
        can :safe_manage, Profile, :user_id => user.id
        can [:safe_manage,:add_examiner, :remove_examiner, :get_examiners], Clinic, :supervisor_id => user.id
        can :safe_manage, Patient do |patient|
          !patient.id || user.can_edit_patient(patient.id)
        end

        can [:safe_manage, :add_examiner, :remove_examiner, :get_examiners, :finalize, 
    :get_patients, :add_patient, :add_ddt_question , :get_ddt_questions, :remove_ddt_question], Study do |study|
          !study.id || user.can_edit_study(study.id)
        end

        can :safe_manage, BasicDemographic do |basic_demographic|
          !basic_demographic.patient || user.can_edit_patient(basic_demographic.patient.id)
        end

    end
  end
end
