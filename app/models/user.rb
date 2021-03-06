class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_one :profile
    has_one_attached :avatar
    has_many :posts, dependent: :destroy
    attr_writer :login
    validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
    validate :validate_username
    validates :username, presence: :true, uniqueness: { case_sensitive: false }
    has_many :likes, dependent: :destroy
    
  def login
    @login || self.username || self.email
  end
    
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end
    
end
