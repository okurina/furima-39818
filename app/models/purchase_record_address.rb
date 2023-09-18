class PurchaseRecordAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :region_id, :post_cord, :city, :street, :building, :telephone

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :city
    validates :street
    validates :post_cord, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid"}
    validates :region_id, numericality: {other_than: 1, message: "can't be blank"}
  end
    
  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    Address.create(post_cord: post_cord, region_id: region_id, city: city, street: street, building: building, telephone: telephone, purchase_record_id: purchase_record.id)
  end
end
