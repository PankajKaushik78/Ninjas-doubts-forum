class RegistrationsController < Devise::RegistrationsController
    private
  
    def account_update_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password, keys: [:designation])
    end
  
  end