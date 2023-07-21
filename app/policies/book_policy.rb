class BookPolicy < ApplicationPolicy
  def show?
    # Users can only see their own bookss
    record.user==user
  end

  def create?
    
    user.present? # Any logged-in user can create a book
  end

  def update?
    # Users can only update their own books
    record.user==user
    
  end

  def destroy?
    # Users can only delete their own books
    record.user==user
    
  end    
  
  class Scope < Scope
    def resolve
      scope.where(user:user) # Regular users can only see their own books
    end
  end
      
end