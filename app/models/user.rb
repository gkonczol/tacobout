class User < ApplicationRecord

	def setup(params = {})
		self.username = params.fetch(:username, "default_username")
		self.password = params.fetch(:password, "default_password")
		self.email = params.fetch(:email, "default@email.com")
	end
end
