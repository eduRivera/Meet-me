require 'rails_helper'

RSpec.describe Location, :type => :model do

	it "Iron Find method returns entry of id number entered" do
		item = Location.new
		item.name = "Favorite"
		item.city = "Barcelona"
		item.country = "Spain"
		item.save
		expect(Location.find(item.id)).to eq(Location.iron_find(item.id))
	end

	it "In_spain? method returns all places in Spain" do
		expect(Location.in_spain?).to eq(Location.where "country ='Spain'")
	end

	it "Last_created method returns n number of results from latest entry " do
		value = 7
		expect(Location.last_created(value)).to eq(Location.order("created_at DESC").limit(value))
	end

	it "Count_visits method returns number of total visit in that month and year" do
		location1 = Location.create name:'Beach', city: 'Mallorca', country: 'Spain'
		Visit.create location_id: location1.id, user_name: "Janes", from_date: Date.today, to_date: Date.today+3
		Visit.create location_id: location1.id, user_name: "Edua", from_date: Date.today, to_date: Date.today+3
		expect(Location.count_visits(7,2014,location1.id)).to eq(2)
	end

	it "validate presence of name" do
		item = Location.create(:name => "")
		expect(item).to_not be_valid
	end

	it "validate length of name" do
		item = Location.create(:name => "aa")
		expect(item).to_not be_valid
	end

	it "validate presence of city" do
		item = Location.create(:city => "")
		expect(item).to_not be_valid
	end

	it "validate format of name" do
		item = Location.create(:name => "edu hola")
		expect(item).to_not be_valid
	end


end
