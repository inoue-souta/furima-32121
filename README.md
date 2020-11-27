
## usersテーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false |
| encrypted_password     | string | null: false |
| first_name             | string | null: false |
| last_name              | string | null: false |
| first_name_kana        | string | null: false |
| last_name_kana         | string | null: false |
| birthday               | string | null: false |

### Association
- has_many :items
- has_many :purchase_records

## itemsテーブル

| Column      | Type    | Options                       |
| ----------- | ------- | ----------------------------- |
| product     | string  | null: false                   |
| explanation | string  | null: false                   |
| category_id | integer | null: false                   |
| status_id   | integer | null: false                   |
| burden_id   | integer | null: false                   |
| area_id     | integer | null: false                   |
| day_id      | integer | null: false                   |
| price       | string  | null: false                   |
| user_id     | string  | null: false foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_record

## purchase_recordsテーブル

| Column      | Type   | Options                       |
| ----------- | ------ | ----------------------------- |
| who         | string | null: false                   |
| buy         | string | null: false                   |
| user_id     | string | null: false foreign_key: true |

### Association
- belongs_to :user
- has_one :item

## street_addressテーブル

| Column             | Type    | Options                       |
| ------------------ | ------- | ----------------------------- |
| postal_code        | string  | null: false                   |
| prefectures_id     | integer | null: false                   |
| municipality       | string  | null: false                   |
| address            | string  | null: false                   |
| building           | string  |                               |
| phone_number       | string  | null: false                   |
| phone_number       | string  | null: false                   |
| purchase_record_id | string  | null: false foreign_key: true |

### Association
- has_one :purchase_record