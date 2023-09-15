class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :region
  belongs_to :shipment

  with_options presence: true do
    validates :item_name
    validates :content
    validates :image
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :situation_id
    validates :delivery_charge_id
    validates :region_id
    validates :shipment_id
  end

  validates :price, numericality: { message: 'には半角数字を使用してください' }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
