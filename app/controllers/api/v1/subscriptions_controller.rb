class Api::V1::SubscriptionsController < ApplicationController
  def index 
    customer = Customer.find(params[:customer_id])
    render json: SubscriptionSerializer.new(customer.subscriptions)
  end

  def create
    begin
      render json: SubscriptionSerializer.new(Subscription.create!(subscription_params)), status: :created
    rescue ActiveRecord::RecordInvalid => e
      render json: ErrorSerializer.new(e).serialized_json, status: :unprocessable_entity
    end
  end

  def update
    subscription = Subscription.find(params[:id])
    subscription.update!(subscription_params)
    render json: SubscriptionSerializer.new(subscription)
  end

  private

  def subscription_params
    params.require(:subscription).permit(:title, :price, :status, :frequency, :tea_id, :customer_id)
  end
end