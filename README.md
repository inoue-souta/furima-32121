
## usersテーブル

| Column                 | Type   | Options      |
| ---------------------- | ------ | ------------ |
| nickname               | string | null: false  |
| email                  | string | unique: true |
| encrypted_password     | string | null: false  |
| first_name             | string | null: false  |
| last_name              | string | null: false  |
| first_name_kana        | string | null: false  |
| last_name_kana         | string | null: false  |
| birthday               | date   | null: false  |

### Association
- has_many :items
- has_many :purchase_records

## itemsテーブル

| Column         | Type    | Options                       |
| -------------- | ------- | ----------------------------- |
| product        | string  | null: false                   |
| explanation    | text    | null: false                   |
| category_id    | integer | null: false                   |
| status_id      | integer | null: false                   |
| burden_id      | integer | null: false                   |
| prefectures_id | integer | null: false                   |
| day_id         | integer | null: false                   |
| price          | integer | null: false                   |
| user_id        | integer | null: false foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_record

## purchase_recordsテーブル

| Column      | Type    | Options                       |
| ----------- | ------- | ----------------------------- |
| item_id     | integer | null: false foreign_key: true |
| user_id     | integer | null: false foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :street_address

## street_addressテーブル

| Column             | Type    | Options                       |
| ------------------ | ------- | ----------------------------- |
| postal_code        | string  | null: false                   |
| prefectures_id     | integer | null: false                   |
| municipality       | string  | null: false                   |
| address            | string  | null: false                   |
| building           | string  |                               |
| phone_number       | string  | null: false                   |
| purchase_record_id | integer | null: false foreign_key: true |

### Association
- belongs_to :purchase_record