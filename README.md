## usersテーブル

| Column             | Type   | Options                     |
| ------------------ | ------ | -----------                 |
| nickname           | string | null: false                 |
| email              | string | null: false, unique: true   |
| encrypted_password | string | null: false                 |
| last_name_kanji    | string | null: false                 |
| first_name_kanji   | string | null: false                 |
| last_name_kana     | string | null: false                 |
| first_name_kana    | string | null: false                 |
| birthday           | date   | null: false                 |

### Association
- has_many :items
- has_many :purchase_records

## itemsテーブル

| Column             | Type       |Options                         |
| ---------------    | ------     | -----------                    |
| category_id        | integer    | null: false                    |
| situation_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| region_id          | integer    | null: false                    |
| shipment_id        | integer    | null: false                    |
| price              | integer    | null: false                    |
| item_name          | string     | null: false                    |
| content            | text       | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :category_id
- belongs_to :situation_id
- belongs_to :delivery_charge_id
- belongs_to :region_id
- belongs_to :shipment_id
- belongs_to :user
- has_one    :purchase_record

### purchase_recordsテーブル

| Column | Type       | Options                        |
| ------ | ------     | -----------                    |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :address

### addressesテーブル

| Column           | Type       | Options                        |
| ------           | ----       | -------                        |
| region_id        | integer    | null: false                    |
| post_cord_id     | string     | null: false                    |
| city             | string     | null: false                    |
| street           | string     | null: false                    |
| building         | string     |                                |
| telephone        | string     | null: false                    |
| purchase_record  | references | null: false, foreign_key: true |

### Association
- belongs_to :post_cord_id
- belongs_to :region_id
- belongs_to :purchase_record
