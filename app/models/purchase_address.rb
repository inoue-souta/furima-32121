class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :purchase_record_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/}
  end

  def save
    Purchase_record.create(item_id: item_id, user_id: user_id)
    Street_address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number, purchase_record_id: purchase_record_id)
  end
end