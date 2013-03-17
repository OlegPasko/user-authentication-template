class User < ActiveRecord::Base
  has_secure_password
  
  validates :email, :format => {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Wrong Email format" }, :uniqueness => true 
end
