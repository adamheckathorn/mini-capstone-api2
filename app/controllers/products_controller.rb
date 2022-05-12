class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def create
    recipe = Product.new(
      name: params["name"],
      price: params["price"],
      description: params["description"],
      image_url: params["image_url"],

    )
    recipe.save
    render json: recipe.as_json
  end

  def show
    product = Product.find_by(id: params["id"])
    render json: product.as_json
  end

  def update
    product = product.find_by(id: params["id"])
    product.name = params["name"] || product.name
    product.price = params["price"] || product.price
    product.description = params["description"] || product.description
    product.image_url = params["image_url"] || product.image_url
    product.save
    render json: product.as_json
  end

  def destroy 
end
