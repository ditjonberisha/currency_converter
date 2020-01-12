require 'rails_helper'

RSpec.describe CurrenciesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Currency. As you add validations to Currency, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { name: 'Dollar', code: 'USD' } }

  let(:invalid_attributes) { { name: nil, code: nil } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CurrenciesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Currency.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      currency = Currency.create! valid_attributes
      get :edit, params: { id: currency.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Currency" do
        expect {
          post :create, params: { currency: valid_attributes }, session: valid_session
        }.to change(Currency, :count).by(1)
      end

      it "redirects to the created currency" do
        post :create, params: { currency: valid_attributes }, session: valid_session
        expect(response).to redirect_to(currencies_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { currency: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { name: 'Euro', code: 'EUR' } }

      it "updates the requested currency" do
        currency = Currency.create! valid_attributes
        put :update, params: { id: currency.to_param, currency: new_attributes }, session: valid_session
        currency.reload
        expect(currency.name).to eq(new_attributes[:name])
        expect(currency.code).to eq(new_attributes[:code])
      end

      it "redirects to the currency" do
        currency = Currency.create! valid_attributes
        put :update, params: { id: currency.to_param, currency: valid_attributes }, session: valid_session
        expect(response).to redirect_to(currencies_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        currency = Currency.create! valid_attributes
        put :update, params: { id: currency.to_param, currency: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested currency" do
      currency = Currency.create! valid_attributes
      expect {
        delete :destroy, params: { id: currency.to_param }, session: valid_session
      }.to change(Currency, :count).by(-1)
    end

    it "redirects to the currencies list" do
      currency = Currency.create! valid_attributes
      delete :destroy, params: { id: currency.to_param }, session: valid_session
      expect(response).to redirect_to(currencies_url)
    end
  end
end
