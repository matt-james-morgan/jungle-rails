class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 2 }

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = User.find_by('lower(email) = ?', email)
  
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end