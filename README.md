
## usersテーブル

| Column      | Type   | Options  |
| ----------- | ------ | -------- |
| nickname    | string | not null |
| email       | string | not null |
| password    | string | not null |
| name        | text   | not null |
| nameKANA    | text   | not null |
| birthday    | date   | not null |

### Association
- has_many :items
- has_many :purchase records

## itemsテーブル

| Column      | Type   | Options  |
| ----------- | ------ | -------- |
| image       | string | not null |
| product     | string | not null |
| explanation | string | not null |
| category    | string | not null |
| status      | string | not null |
| burden      | string | not null |
| area        | string | not null |
| day         | string | not null |
| price       | string | not null |
| user_id     | string | not null |

### Association
- belongs_to :users
- has_one :purchase records

## purchase recordsテーブル

| Column      | Type   | Options  |
| ----------- | ------ | -------- |
| who         | string | not null |
| when        | string | not null |
| buy         | string | not null |
| user_id     | string | not null |

### Association
- belongs_to :users
- has_one :items

## street addressテーブル

| Column       | Type    | Options  |
| ------------ | ------- | -------- |
| postal code  | integer | not null |
| prefectures  | string  | not null |
| municipality | text    | not null |
| address      | text    | not null |
| building     | text    | not null |
| phone number | integer | not null |

### Association
- has_one :purchase records