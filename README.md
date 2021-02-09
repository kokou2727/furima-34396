# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| last_name      | string | null: false |
| first_name     | string | null: false |
| last_furigana  | string | null: false |
| first_furigana | string | null: false |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |


### Association

- has_many :items
- has_many :records

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| description   | text       | null: false                    |
| category      | string     | null: false                    |
| state         | string     | null: false                    |
| price         | integer    | null: false                    |
| from          | string     | null: false                    |
| shipping_date | string     | null: false                    |
| fee           | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :addresses
- has_one :records

## records テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :addresses

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :records
- belongs_to :items