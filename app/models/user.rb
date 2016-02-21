class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable
	     #,
	     #:omniauthable, :omniauth_providers => [:facebook, :twitter]

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :profile_name, presence: true, uniqueness: true, format: {
		with: /\A[a-zA-Z0-9_-]+\z/,
		message: "must be formatted without spaces"
	}


	has_many :statuses, dependent: :destroy

	#Custom method to return full name
	def full_name
		first_name + " " + last_name
	end

	#Custom method for social authentication
	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
	    user.first_name = auth.info.name   # assuming the user model has a name
	    #user.image = auth.info.image # assuming the user model has an image
	  end
	end

end
