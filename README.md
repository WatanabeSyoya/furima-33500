# テーブル設計

## usersテーブル
| Column           | Type    | Options      |
| ---------------- | ------  | -----------  |
| nickname         | string  | null: false  |
| email            | string  | null: false  |
| password         | string  | null: false  |
| last_name        | string  | null: false  |
| first_name       | string  | null: false  |
| last_name_kana   | string  | null: false  |
| first_name_kana  | string  | null: false  |
| birthday_year    | string  | null: false  |
| birthday_month   | string  | null: false  |
| birthday_day     | string  | null: false  |

### Association
- has_many :items
- has_many :orders



## itemsテーブル
| Column            | Type        | Options            |
| ----------------- | ----------- | ------------------ |
| item_name         | string      | null: false        |
| text              | text        | null: false        |
| category          | string      | null: false        |
| item_condition    | string      | null: false        |
| shipping_charges  | string      | null: false        |
| shipping_area     | string      | null: false        |
| days_to_ship      | string      | null: false        |
| price             | integer     | null: false        |
| user              | references  | foreign_key: true  |

### Association
- has_one :order
- belongs_to :user



## ordersテーブル
| Column  | Type        | Options            |
| ------- | ----------- | ------------------ |
| user    | references  | foreign_key: true  |
| item    | references  | foreign_key: true  |

### Association
- has_one :address
- belongs_to :user
- belongs_to :item



##  addressesテーブル
| Column        | Type        | Options            |
| ------------- | ----------- | ------------------ |
| postcode      | string      | null: false        |
| prefecture    | string      | null: false        |
| city          | string      | null: false        |
| block         | string      | null: false        |
| building      | string      |                    |
| phone_number  | string      | null: false        |
| order         | references  | foreign_key: true  |

### Association
- belongs_to :order
