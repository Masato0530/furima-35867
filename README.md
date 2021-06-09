# テーブル設計

## users テーブル

| Column               | Type   | Options                   |
| --------             | ------ | -----------               |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| first_name           | string | null: false               |
| last_name            | string | null: false               |
| first_name_kana      | string | null: false               |
| last_name_kana       | string | null: false               |
| birthday             | date   | null: false               |

## Association

- has_many :items
- has_many :histories



## buys テーブル

|  Column       | Type        | Options                        |
| --------      | ------      | ---------------------------    |
| post_code     | string	    | null: false                    |
| prefecture_id | integer	    | null: false                    |
| city          | string	    | null: false                    |
| address       | string	    | null: false                    |
| building      | string      |                                |
| phone_number  | string      | null: false                    |
| history       | references  | foreign_key: true              |

## Association

- has_one :history


## items テーブル

| Colum              | Type        | Options            |
| --------           | ------      | -----------        |
| name               | string      | null: false        |
| price              | integer     | null: false        |
| user               | references  | foreign_key: true  | 
| category_id        | integer     | null: false        |
| condition_id       | integer     | null: false        |
| shipping_charge_id | integer     | null: false        |
| product_status_id  | integer     | null: false        |
| shipping_area_id   | integer     | null: false        |
| description        | text        | null: false        |

## Association

- belongs_to :user 
- has_one :history


## history テーブル

| Colum              | Type           | Options            |
| --------           | ------         | -----------        |
| user               | references     | foreign_key: true  |
| items              | references     | foreign_key: true  |

## Association

- belongs_to :user
- belongs_to :item
- has_one :buy

