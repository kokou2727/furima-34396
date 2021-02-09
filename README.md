# テーブル設計

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| last_name          | string | null: false                |
| first_name         | string | null: false                |
| last_furigana      | string | null: false                |
| first_furigana     | string | null: false                |
| nickname           | string | null: false                |
| email              | string | null: false, unique: true  |
| encrypted_password | string | null: false                |
| birthday           | date   | null: false                |


### Association

- has_many :items
- has_many :records

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| state_id         | integer    | null: false                    |
| price            | integer    | null: false                    |
| from_id          | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| fee_id           | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :record

## records テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| phone_number  | string     | null: false                    |
| record        | references | null: false, foreign_key: true |

### Association

- belongs_to :record