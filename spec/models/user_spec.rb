require 'rails_helper'

RSpec.describe User, type: :model do
  	let(:user) {FactoryBot.build(:user)}
	
	it "expects a user configured with setup to have different username, password, and email" do
		user.setup(username: "test", password: "testpass", email: "test@email.com")
		expect(user.username).to eq("test")
		expect(user.password).to eq("testpass")
		expect(user.email).to eq("test@email.com")
	end
end
