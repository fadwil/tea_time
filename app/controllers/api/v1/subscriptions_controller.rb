class Api::V1::SubscriptionsController < ApplicationController
  def create
    # begin
    render json: SubscriptionSerializer.new(Subscription.create!(subscription_params)), status: :created
    # rescue => e
    #   redner json: ErrorSerializer.new(e).serialized_json, status: 
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