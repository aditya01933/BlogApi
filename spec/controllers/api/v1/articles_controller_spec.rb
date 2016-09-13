require 'rails_helper'
require 'pp'
module Api;module V1
  RSpec.describe ArticlesController, type: :request do

    #{"owner_name":"matz", "id":"12312", "name":"something", "price":"30$", "description":"something"}
    describe "GET /articles/{id}" do
      context "when article found" do
        it "returns the specified article" do
          owner = FactoryGirl.create(:owner)
          article_id = FactoryGirl.create(:article, owner_id: owner.id).id
          get "/v1/articles/#{article_id}"         
          body = JSON.parse(response.body)

          expect(response.status).to eq 200
          expect(body["id"]).to eq(article_id)
        end  
      end

      context "when article not found" do 
        it "returns 404 not found status" do
          get "/v1/fake_id"
          expect(response.status).to eq 404
        end
      end
    end   

  end
end;end
