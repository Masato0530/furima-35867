# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| --------             | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| first_name           | string | null: false |
| last_name            | string | null: false |
| birthday             | date   | null: false |

## Association

- has_many :items
- belongs_to :buys
- belongs_to :card


## buys テーブル

|  Column       | Type    | Options                        |
| --------      | ------  | ---------------------------    |
| user_id       | integer | null: false, foreign_key: true |
| family_name   | string  | null: false                    |
| first_name    | string  | null: false                    |
| post_code     | string	| null: false                    |
| prefecture    | string	| null: false                    |
| city          | string	| null: false                    |
| address       | string	| null: false                    |
| building      | string  |                                |
| phone_number  | string  |                                |

## Association

- belongs_to :user


## card テーブル

| Column       | Type    | Options                        |
| --------     | ------  | ---------------------------    |
| user_id      | integer | null: false, foreign_key: true |
| customer_id  | string  | null: false                    |
| card_id      | string  |  null: false                   |


## Association

- belongs_to :user



## items テーブル

| Colum        | Type        | Options                        |
| --------     | ------      | -----------                    |
| images       | string      | null: false                    |
| name         | string      | null: false                    |
| item_text    | text        | null: false                    |
| price        | integer     | null: false                    |
| user_id      | references  | null: false, foreign_key: true |

## Association

- belongs_to :user 