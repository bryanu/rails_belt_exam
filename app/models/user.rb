class User < ActiveRecord::Base
  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :email, uniqueness: { case_sensitive: false, message: "This email has already registered, please Log-in" }, format: { with: EMAIL_REGEX }

  before_save do
     self.email.downcase!
  end

end
