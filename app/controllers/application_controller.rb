class ApplicationController < ActionController::Base
  
  include Pundit
  
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
    


  # Use the admin? method from the User model to check if the current user is an admin
  def admin?
    current_user&.admin? # Assuming 'admin?' is the method in the User model
  end
  helper_method :admin? # Make the helper method available in views
    
    # rescue_from CanCan::AccessDenied do |exception|
    #     redirect_to root_path, :alert => exception.message
    # end

  
   
end
