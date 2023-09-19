class PurchaseRecordsController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :authenticate_user!, except: [:index, :create]
  before_action :pay_key, only: [:index, :create]

  def index
    @purchase_record_address = PurchaseRecordAddress.new
    return unless current_user == @item.user || @item.purchase_record

    redirect_to root_path
  end

  def create
    @purchase_record_address = PurchaseRecordAddress.new(purchase_record_params)
    if @purchase_record_address.valid?
      pay_item
      @purchase_record_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_record_address).permit(:post_cord, :region_id, :city, :street, :building, :telephone).merge(
      item_id: @item.id, user_id: current_user.id, token: params[:token]
    )
  end

  def set_item
    item_id = params[:item_id]
    @item = Item.find(item_id)
  end

  def move_to_index
    return if user_signed_in?

    redirect_to root_path
  end

  def pay_key
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end
end
