## usersテーブル

| Column             | Type   | Options                              |
| ------------------ | ------ | -----------                          |
| nickname           | string | null: false                          |
| email              | string | null: false, unique_constraint: true |
| encrypted_password | string | null: false                          |
| last_name_a        | string | null: false                          |
| first_name_a       | string | null: false                          |
| last_name_b        | string | null: false                          |
| first_name_b       | string | null: false                          |
| birthday           | string | null: false                          |

### Association
- has_many :items
- has_many :purchase-record

## itemsテーブル

| Column          | Type       |Options                         |
| --------------- | ------     | -----------                    |
| category        | string     | null: false                    |
| situation       | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| region          | string     | null: false                    |
| date            | string     | null: false                    |
| price           | string     | null: false                    |
| content         | text       | null: false                    |
| users           | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :purchase-record

### purchase-recordsテーブル

| Column | Type       | Options                        |
| ------ | ------     | -----------                    |
| items  | references | null: false, foreign_key: true |
| users  | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
- belongs_to :addresses

### addressesテーブル

| Column           | Type       | Options                        |
| ------           | ----       | -------                        |
| post_cord        | string     | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| street           | string     | null: false                    |
| building         | string     | null: false                    |
| telephone        | string     | null: false                    |

### Association
- belongs_to :purchase-record




