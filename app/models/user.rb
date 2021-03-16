class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save :sanitize_text
  

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true,
            length: { minimun: 5, maximum: 10 }
  validates :name, presence: true
  validates :email, presence: true,
            uniqueness: {case_sensitive: false},
            length: {maximum: 25},
            format: {with: VALID_EMAIL_REGEX}
  
  def sanitize_text
    #self.username = username.downcase
    #self.name = name.titleize
    self.email = email.downcase
  end
end
