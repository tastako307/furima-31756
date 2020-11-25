# README


## users
| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |
| nickname           | string              | null: false             |
| last_name          | string              | null: false             |
| first_name         | string              | null: false             |
| last_name_kana     | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birthday           | date                | null: false             |


### Association
has_many :items
has_many :orders

## items
| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
|user                |references           | null: false, foreign_key: true |
|category_id         |integer              | null: false                    |
|deadline_id         |integer              | null: false                    |
|prefecture_id       |integer              | null: false                    |
|condition_id        |integer              | null: false                    |
|fee_id              |integer              | null: false                    |
|price               |integer              | null: false                    |
|name                |string               | null: false                    |
|text                |text                 | null: false                    |

### Association
belongs_to :user 
belongs_to :category
belongs_to :brand
belongs_to :prefecture
belongs_to :condition
belongs_to :fee
has_one :order
has_one_attached :image

## deliveries

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
|order               | references          | null: false, foreign_key: true |
|prefecture_id       | integer             | null: false                    |
|post_number         | string              | null: false                    |
|address_1           | string              | null: false                    |
|address_2           | string              | null: false                    |
|building            | string              | default: ""                    |
|phone_number        | string              | null: false                    |

### Association
belongs_to :order 
belongs_to :prefecture



## orders
| Column             | Type                | Options                                      |
|--------------------|---------------------|----------------------------------------------|
|item                |references           | null: false, foreign_key: true, unique: true |
|user                |references           | null: false, foreign_key: true               |


### Association
belongs_to :item
belongs_to :user
has_one :delivery

