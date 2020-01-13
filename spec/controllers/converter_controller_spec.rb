require 'rails_helper'

RSpec.describe ConverterController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "returns a success response" do
      expect(Rate).to receive(:convert_value).and_return(1)
      post :create, xhr: true, params: {}
      expect(response).to be_successful
    end
  end
end
