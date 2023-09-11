class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category_id
  belongs_to :situation_id
  belongs_to :delivery_charge_id
  belongs_to :region_id
  belongs_to :shipment_id
  
  belongs_to :user


end
