class PurchaseRecordsController < ApplicationController
  def index
    @purchase_record_address = PurchaseRecordAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
    @purchase_record_address = PurchaseRecordAddress.new(purchase_record_address_params)
    if @purchase_record_address.valid?
      @purchase_record_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_record_address_params
    params.require(:purchase_record_address).permit(:post_code, :region_id, :city, :street, :building, :telephone).merge(item_id: params, user_id: current_user.id)
  end

end
