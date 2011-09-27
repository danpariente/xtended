class Ability 
	include CanCan::Ability
		
	def initialize(user) 
	  user ||= User.new 	
		
	  if user.role? :admin
	    can :manage, :all 		
	  else
	     can :read, :all		
	  end
	  if user.role? :jobseeker
	    can :read, @Page		  	 	
	  end	 
	  if user.role? :employer
	    can :create, @Page
	    can :update, @Page		  	 	
	  end	 
	end
end