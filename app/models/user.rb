class User < ActiveRecord::Base
	has_secure_password
	attr_accessible :email, 
									:password, 
									:password_confirmation,
									:name,
									:phone,
									:cellphone,
									:address,
									:created_by,
									:updated_by
	validates :password, presence: true, on: :create
	validates :email, presence: true
	before_create { generate_token(:auth_token)}

	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end
end