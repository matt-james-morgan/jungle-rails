class Admin::DashboardController < ApplicationController

  before_action :authenticate

  def show
    @total_products = Product.sum(:quantity)
    @total_categories = Category.count
  end

 

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['USERNAME'] && password == ENV['PASSWORD'] 
    end
  end
end
