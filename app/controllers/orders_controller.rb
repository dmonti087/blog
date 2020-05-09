class OrdersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end


  def show
    #@order = Order.find(params[:id])
    set_order
  end

def new
  @order = Order.new
  #@page = Page.new
end


def create
  @order = Order.new(order_params)
    if @order.save
     flash.notice = 'Order has been created successfully'
     redirect_to @order
   else
     flash.now.alert = @order.errors.full_messages.to_sentence
     render :new
   end
end

def edit
#@order = Order.find(params[:id])
set_order
end


def update
#@order = Order.find(params[:id])
set_order
  if @order.update(order_params)
    flash.notice = 'Order was updated successfully'
    redirect_to @order
  else
    flash.now.alert = @order.errors.full_messages.to_sentence
    render :edit
  end
end

def destroy
 #@order = Order.find(params[:id])
 set_order
 @order.destroy
 flash.notice = 'Order was deleted successfully'
 redirect_to orders_path
end



private

      def order_params
      params.require(:order).permit(:customer_id, :product_name, :product_count)
      end


      def set_order
        @order = Order.find(params[:id])
      end


      def catch_not_found(e)
        Rails.logger.debug("We had a not found exception.")
        flash.alert = e.to_s
        redirect_to orders_path
       end

end
