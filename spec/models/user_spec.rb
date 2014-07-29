require 'rails_helper'

RSpec.describe User, :type => :model do
  
	it "can asing name" do
		name = ""
		user = User.new name:name
		expect(user.name).to eq (name)
	end

	it "can asing email" do
		email = "Edu@gmail.com"
		user = User.new email:email
		expect(user.email).to eq (email)
	end

	it "can asing pwd" do
		pwd = "123-abc123"
		user = User.new pwd:pwd
		expect(user.pwd).to eq (pwd)
	end

	it "validate name, email, pwd" do
		user = User.new name:"Edu", email:"Edu@gmail.com", pwd:"123"
		expect(user).to be_valid
	end

end
