class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"],
  password: ENV["PASSWORD"],
  if: -> { ENV["PASSWORD"].present? }

protect_from_forgery with: :exception
  
  def show
    @product_count = Product.count
    @categories_count = Category.count
  end
end
