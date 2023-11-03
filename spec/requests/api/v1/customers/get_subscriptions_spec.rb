require "rails_helper"

RSpec.describe "Get /api/v1/customers/:id/subscriptions", type: :request do
  describe "happy path" do
    it "returns all subscriptions for a customer" do
      customer = create(:customer)
      tea1 = create(:tea)
      tea2 = create(:tea)

      active_subscription1 = create(:subscription, customer: customer, tea: tea1, status: 'active')
      cancelled_subscription1 = create(:subscription, customer: customer, tea: tea1, status: 'cancelled')

      active_subscription2 = create(:subscription, customer: customer, tea: tea2, status: 'active')
      cancelled_subscription2 = create(:subscription, customer: customer, tea: tea2, status: 'cancelled')

      get "/api/v1/customers/#{customer.id}/subscriptions", as: :json

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)

      subscriptions = JSON.parse(response.body)['data']

      expect(subscriptions.count).to eq(4)
      expect(subscriptions.pluck('id').map(&:to_i)).to include(
        active_subscription1.id, cancelled_subscription1.id,
        active_subscription2.id, cancelled_subscription2.id
      )
    end
  end

  describe "sad path" do
    it "returns a not found response if the customer does not exist" do
      non_existent_customer_id = 123123123 

      get "/api/v1/customers/#{non_existent_customer_id}/subscriptions", as: :json

      expect(response).not_to be_successful
      expect(response).to have_http_status(:not_found)

      error_response = JSON.parse(response.body, symbolize_names: true)
      expect(error_response[:errors].first[:details]).to eq("Couldn't find Customer with 'id'=123123123")

    end
  end
end