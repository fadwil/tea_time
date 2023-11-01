require "rails_helper"

RSpec.describe "POST /api/v1/subscriptions", type: :request do
  describe "happy path" do
    it "creates subscription for customer" do
      customer = create(:customer)
      tea = create(:tea)

      subscription_params = {
        title: 'Monthly Subscription',
        price: 19.99,
        status: 'active',
        frequency: 'monthly',
        tea_id: tea.id,
        customer_id: customer.id
      }
      
      expect(customer.subscriptions.count).to eq(0)

      post "/api/v1/subscriptions", params: subscription_params, as: :json

      expect(response).to be_successful
      expect(response).to have_http_status(:created)
      expect(customer.subscriptions.count).to eq(1)
      
      new_subscription = JSON.parse(response.body, symbolize_names: true)

      expect(new_subscription[:data].keys).to eq([:id, :type, :attributes])
      expect(new_subscription[:data][:id]).to be_a(String)
      expect(new_subscription[:data][:type]).to eq("subscription")
      expect(new_subscription[:data][:attributes]).to be_a(Hash)
      expect(new_subscription[:data][:attributes].keys).to eq([:title, :price, :status, :frequency, :tea_id, :customer_id])
      expect(new_subscription[:data][:attributes][:title]).to be_a(String)
      expect(new_subscription[:data][:attributes][:price]).to be_a(String)
      expect(new_subscription[:data][:attributes][:status]).to be_a(String)
      expect(new_subscription[:data][:attributes][:frequency]).to be_a(String)
      expect(new_subscription[:data][:attributes][:tea_id]).to eq(Subscription.last.tea_id)
      expect(new_subscription[:data][:attributes][:customer_id]).to eq(Subscription.last.customer_id)
    end
  end
end