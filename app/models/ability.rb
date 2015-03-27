class Ability
  include CanCan::Ability

  
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  
  def initialize(u)
      @user = u || User.new
      role = @user.role_name rescue 'regular'
      send(role)
    end
  	#{'regular' => 'Regular User', 'registered' => 'Registered User', 'paid' => 'Paid User', 'chapter_admin' => 'Chapter Admin', 'admin' => 'National Admin', 'super_admin' => 'Super Admin', 'developer' => 'Developer'}
    # the roles are defined in Role
    # any matching method here will authorize or deauthorize
    # abilities
#    def guest
#      cannot :manage, :all
#      can :read, :welcome
#    end
  
    def regular
      cannot :manage, :all
      can :read, :welcome
    end
  
    def registered
      regular
      can :manage, :profile
      can :manage, :photos
      can :manage, :albums
      cannot :destroy, :photos
      cannot :destroy, :albums
    end
  
    def paid
      registered
      can :destroy, :photos
      can :read, :all
      cannot :read, :admin
    end
  
    def chapter_admin
      paid
      # other stuff
      can :manage, :chapters
      can :manage, :minutes
      can :read, :all
    end
    
    def admin
    	chapter_admin  
    	
      can :manage, :all
      cannot :manage, [:super_admin, :developer]
    end
  
    def super_admin
      admin
      can :manage, [:super_admin]
      cannot :destroy, :developer
    end
  
    def developer
      # no need to call something else, developer is unrestricted
      can :manage, :all
    end
  
end
