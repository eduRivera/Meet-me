require 'rails_helper'

RSpec.describe Visit, :type => :model do

	it "validate presence of from_date" do
		item = Visit.new()
		expect(item).to_not be_valid
	end

	it "validate presence of name" do
	 	item = Visit.create(:user_name => "")
		expect(item).to_not be_valid
	end

	it "validate format of name" do
	 	item = Visit.create(:user_name => "/nksdf")
		expect(item).to_not be_valid
	end
	
	it "validate is associated to a location" do
		item = Location.create(:id => "")
		expect(item).to_not be_valid
	end

	it "validate is associated to a location" do
		item = Location.create(:id => "")
		expect(item).to_not be_valid
	end
	it "from_date into the future" do
		item = Visit.new(from_date: Date.today-1, user_name: "nksdf")
		item.valid?
		expect(item.errors[:from_date]).to eq(["can't be in the past"])
	end

	it "from_date before to_date" do
		item = Visit.new(from_date: Date.today, user_name: "nksdf", to_date: Date.today-1)
		item.valid?
		expect(item.errors[:from_date]).to eq(["from_date can't be before to_date"])
		#expect(item.valid?).to eq (false)
	end
end
