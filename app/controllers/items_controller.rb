class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destoroy]
  before_action :move_to_index, only: :edit
  before_action :set_tweet, only: [:show, :edit, :update]


  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :situation_id, :delivery_charge_id, :region_id, :shipment_id, :price, :item_name,
                                 :content, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.includes(:user).find(params[:id])
    return if user_signed_in? && current_user == @item.user
    redirect_to action: :index
  end

  def set_tweet
    @item = Item.includes(:user).find(params[:id])
  end
end
