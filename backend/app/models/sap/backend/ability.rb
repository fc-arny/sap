module Sap
  module Backend
    class Ability
      include CanCan::Ability
      def initialize(user)
        can :read, :all
        can :manage, :all
        can :access, :rails_admin
        can :dashboard
      end
    end
  end
end
