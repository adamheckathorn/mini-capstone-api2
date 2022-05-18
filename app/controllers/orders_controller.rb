class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = Order.where(user_id: current_user.id)
    # ALTERNATIVE:
    # @orders = current_user.orders

    render template: "orders/index"
  end

  def create
    product = Product.find_by(id: params[:product_id])
    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )
    @order.save
    render template: "orders/show"
  end

  def show
    @order = Order.find_by(id: params[:id], user_id: current_user.id)
    # ALTERNATIVE:
    # @order = current_user.orders.find_by(id: params[:id])

    render template: "orders/show"
  end
end