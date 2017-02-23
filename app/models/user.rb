class User < ActiveRecord::Base
  has_secure_password

  has_many :lists

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :email, uniqueness: { case_sensitive: false, message: "You have already registered with these credentials, please Log-in" }, format: { with: EMAIL_REGEX }
  validates :password, confirmation: :true, length: { in: 8..16 }
  validates_presence_of :password, on: :create

  before_save do
     self.email.downcase!
  end

end
