class CartController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    session[:cart] = {} unless session[:cart]

    @cart = Product.where(id: session[:cart].keys)
    @quantity = session[:cart].values
  end

  def clear
    session[:cart] = nil
  
    redirect_to cart_path
  end

  def add
    id = params[:id]

    session[:cart] = {} unless session[:cart]

    session[:cart][id] = session[:cart][id] ? session[:cart][id]+1 : 1

    redirect_to cart_path
  end
end
