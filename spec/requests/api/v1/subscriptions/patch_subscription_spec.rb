require 'rails_helper'

RSpec.describe "PATCH /api/v1/subscriptions/:id", type: :request do
  describe "happy path" do
    it "updates a customers subscription status" do
      customer = create(:customer)
      tea = create(:tea)
      subscription = create(:subscription, status: 'active')

      expect(subscription.status).to eq('active')

      patch "/api/v1/subscriptions/#{subscription.id}", params: { subscription: { status: 'cancelled' } }, as: :json

      updated_subscription = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
      expect(updated_subscription[:data][:attributes][:status]).to eq('cancelled')
    end
  end

  describe "sad path" do
    it "fails to update a subscription with invalid parameters" do
      subscription = create(:subscription, status: 'active')

      expect(subscription.status).to eq('active')

      patch "/api/v1/subscriptions/#{subscription.id}", params: { subscription: { status: 'invalid_status' } }, as: :json

      error_response = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to have_http_status(:unprocessable_entity)
      expect(error_response[:errors]).to include({ details: "Validation failed: Status is not included in the list" })
    end
  end
end