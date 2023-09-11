class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :region
  belongs_to :shipment
  
  belongs_to :user

end
