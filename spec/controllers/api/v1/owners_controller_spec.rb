require 'rails_helper'
module Api;module V1
  RSpec.describe OwnersController, type: :request do

    before(:all) do 
      @owner = FactoryGirl.create(:owner) 
      article = FactoryGirl.create(:article, owner_id: @owner.id)
    end

    #{"owner_name": "matz", "articles": [{"id":"1", "name":"iPhone 12SC Plus", "price":"42000$", "description":"this is a revolution"}, {...}]}
    describe "GET /owner_name/articles " do
      it "returns article belongs particle owner" do 
        owner_name = @owner.name       
        get "/v1/#{owner_name}/articles"
        body = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(body["owner_name"]).to include(@owner.name)
        expect(body["articles"].count).to > 0
      end
    end

    #{"owners": [{"name":"matz"}, {...}]}
    describe "GET /owners " do
      it "returns array of owners" do
                
        get '/v1/owners'

        body = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(body["owners"][-1]["name"]).to include(@owner.name)
      end
    end

    #{"owner_name":"matz"}
    describe "GET /owner_name " do
      it "returns owner information" do
                 
        get "/v1/#{@owner.name}"
        body = JSON.parse(response.body)

        expect(response.status).to eq 200
        expect(body["owner_name"]).to include(@owner.name)
      end
    end


  end
end;end
