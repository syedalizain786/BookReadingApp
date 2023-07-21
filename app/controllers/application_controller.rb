class ApplicationController < ActionController::Base
  include Pagy::Backend
  
  include Pundit
  
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
    


    
    # rescue_from CanCan::AccessDenied do |exception|
    #     redirect_to root_path, :alert => exception.message
    # end

  
   
end
