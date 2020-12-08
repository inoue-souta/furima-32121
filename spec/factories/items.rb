FactoryBot.define do
  factory :item do
    product             {"a"}
    explanation         {"a"}
    category_id         {2}
    status_id           {2}
    burden_id           {2}
    prefecture_id       {2}
    day_id              {2}
    price               {300}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/logo.png'), filename: 'logo.png')
    end
  end
end
