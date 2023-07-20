class User < ApplicationRecord
  def admin?
        id== 1
   end

   #Relation b/w user and book
  has_many :books

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        
end
