class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
    
  end

  def create
    @order_form = OrderForm.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_form.valid?
      pay_item
      @order_form.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],   
      currency: 'jpy'              
    )
  end


end
