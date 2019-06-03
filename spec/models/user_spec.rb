require 'rails_helper'

RSpec.describe User, type: :model do
  	user = User.new
	user.setup(username: "test", password: "testpass", email: "test@email.com")
	
	it "expects a user configured with setup to have different username, password, and email" do
		expect(user.username).to eq("test")
		expect(user.password).to eq("testpass")
		expect(user.email).to eq("test@email.com")
	end
end
