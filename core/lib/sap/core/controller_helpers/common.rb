 # -------------------------------------------------------------
 # Common helpers method for controller
 # -------------------------------------------------------------
module Sap
  module Core
    module ControllerHelpers
      module Common
        extend ActiveSupport::Concern

        def self.included(base)
          base.class_eval do
            helper_method :current_store
            helper_method :current_user
          end
        end


        # -------------------------------------------------------------
        # Getting current store or return default value
        # -------------------------------------------------------------
        def current_store
          @current_store = session[:store_id].nil? ? Sap::Store.first : Sap::Store.find(session[:store_id])
        end

        # -------------------------------------------------------------
        # Current user or nil
        # @return [Sap::User, nil]
        # -------------------------------------------------------------
        #def current_user
        #  @current_user ||= Sap::User.find(session[:user_id]) if session[:user_id]
        #end



      end
    end
  end
end
