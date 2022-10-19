# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :items
- has_one :order



## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
| description        | text       | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| shipping_origin_id | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |



### Association

- belongs_to :user
- has_one :order

##  destinations テーブル

| Column             | Type       | Options                        | 
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| shipping_origin_id | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |



### Association

- has_one :order


##  orders テーブル

| Column   | Type       | Options                        | 
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :destination
- belongs_to :item