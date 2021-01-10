class RegistrationsController < Devise::RegistrationsController

    def create
      super
      if resource.persisted?
        if resource.designation == "assistant"
          resource.create_assistant
        end
      end
    end


    private
  
    # def sign_up_params
    #   params.require(:user).permit(:username, :email, :password, :password_confirmation)
    # end
  
    # def account_update_params
    #   params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password, keys: [:designation])
    # end
  
  end