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
- has_one :destination
- has_one :order



## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| price           | string     | null: false                    |
| description     | text       | null: false                    |
| status          | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| shipping_origin | string     | null: false                    |
| shipping_days   | string     | null: false                    |
| category        | string     | null: false                    |
| image           | text       | null: false                    |
| user            | references | null: false, foreign_key: true |



### Association

- belongs_to :user

##  destinations テーブル

| Column           | Type       | Options                        | 
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| family_name      | string     | null: false                    |
| first_name       | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| post_code        | string     | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     |                                |



### Association

- belongs_to :user


##  orders テーブル

| Column   | Type       | Options                        | 
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| customer | string     | null: false,                   |
| card     | integer    | null: false,                   |

### Association

- belongs_to :user