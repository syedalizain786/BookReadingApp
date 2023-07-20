class BookPolicy < ApplicationPolicy
  def show?
    # Users can only see their own books
    user == record.user || user.admin?
  end

  def create?
    
    user.present? # Any logged-in user can create a book
  end

  def update?
    # Users can only update their own books
    user == record.user || user.admin?
  end

  def destroy?
    # Users can only delete their own books
    user == record.user || user.admin?
  end    
  
  class Scope < Scope
    if user.admin?
      scope.all # Admins can see all books
    else
      scope.where(user:user) # Regular users can only see their own books
    end
      end
      
end