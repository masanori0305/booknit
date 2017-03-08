class User < ActiveRecord::Base

  devise :database_authenticatable, :omniauthable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :books
  has_many :comments
  has_many :likes

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    unless user
      user = User.create(name: auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid: auth.uid,
                         email: auth.info.email,
                         password: Devise.friendly_token[0, 20]
                         )
    end
    user
  end


  def self.create_unique_string
    SecureRandom.uuid
  end

  private
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end


end
