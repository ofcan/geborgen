class User < ApplicationRecord
  
  has_many :posts
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # Validation for single-user system
  validate :only_one
  
  private
  
  # Validation for single-user system
  def only_one
    if User.count >= 1
      errors.add :base, 'There is only one God.' 
    end
  end
  
end
