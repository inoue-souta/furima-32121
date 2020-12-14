FactoryBot.define do
  factory :purchase_address do
    postal_code{'123-4567'}
    prefecture_id{2}
    municipality{"あ"}
    address{"あ"}
    phone_number{"09012345678"}
  end
end
