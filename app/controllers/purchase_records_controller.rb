class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_record_address = PurchaseRecordAddress.new
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create 
    @purchase_record_address = PurchaseRecordAddress.new(purchase_record_params)
    if @purchase_record_address.valid?
      @purchase_record_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_record_address).permit(:post_cord, :region_id, :city, :street, :building, :telephone).merge(item_id: @item.id, user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
