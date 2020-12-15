class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/}
  end

  def save
    purchaserecord = PurchaseRecord.create(item_id: item_id, user_id: user_id) #purchaserecord (id: 1 , item_id: 2 ,user_id: 3)
    StreetAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number, purchase_record_id: purchaserecord.id)#purchaserecord.id
  end
end