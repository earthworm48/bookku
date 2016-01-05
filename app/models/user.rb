class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :book_transactions
  has_many :books
  has_many :point_transactions

  acts_as_messageable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	devise :omniauthable, :omniauth_providers => [:facebook]
	

	def mailboxer_email(object)
		email
	end

	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
	    user.username = auth.info.name   # assuming the user model has a name
	  end
	end	
end
