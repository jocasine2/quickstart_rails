class RegistrationsController < Devise::RegistrationsController
    skip_before_action :require_no_authentication, only: [:new, :create]
  
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, natural_person_attributes: [:name, :last_name]])
    end
      
    
    def create
        # Montando User
        user = User.new
        user.email = params[:user][:email]
        user.password = params[:user][:password]
        user.password_confirmation = params[:user][:password_confirmation]
      
        # Montando NaturalPerson
        natural_person = NaturalPerson.new
        natural_person.name = params[:natural_person][:name]
        natural_person.last_name = params[:natural_person][:last_name]
      
        if natural_person.save
          # Associando NaturalPerson ao User
          user.natural_person = natural_person
      
          if user.save
            sign_in(user)
            respond_with user, location: after_sign_up_path_for(user)
          else
            clean_up_passwords user
            set_minimum_password_length
            respond_with user
          end
        else
          clean_up_passwords user
          set_minimum_password_length
          respond_with user
        end
    end
      
  
    private
  
    def natural_person_params
      params.require(:user).permit(:name, :last_name)
    end
  
    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
  