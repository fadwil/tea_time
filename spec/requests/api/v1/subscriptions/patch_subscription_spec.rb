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
end