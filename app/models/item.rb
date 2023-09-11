class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :item_name, :content, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :situation_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipment_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :image, presence: true
  
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :region
  belongs_to :shipment

  belongs_to :user
  has_one_attached :image

end
