require 'rails_helper'

RSpec.describe "LocationRouting", :type => :routing do

    context 'show' do

        it "test route" do
            expect(:get => "/locations").to route_to("locations#index")
        end

        it "test route" do
            expect(:get => "/locations/1/visits/2").to route_to(
                                      :controller => "visits", 
                                      :action => "show",
                                      :location_id => "1",
                                      :id => "2")
        end

    end
end