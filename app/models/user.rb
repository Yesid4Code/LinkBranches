class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save :sanitize_text


  def sanitize_text
    self.username =username.downcase
    self.name = name.titleize
    self.email = email.downcase
  end
end
