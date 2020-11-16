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
has_many :item_logs
has_many :deliveries

## items
| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
|user                |references           | null: false, foreign_key: true |
|category            |integer              | null: false, foreign_key: true |
|brand               |integer              | null: false, foreign_key: true |
|prefecture          |integer              | null: false, foreign_key: true |
|condition           |integer              | null: false, foreign_key: true |
|fee                 |integer              | null: false, foreign_key: true |
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
has_many :users
has_one_attached :image

## deliveries

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
|item_log            | references          | null: false, foreign_key: true |
|prefecture          | integer             | null: false, foreign_key: true |
|post_number         | string              | null: false                    |
|address_1           | string              | null: false                    |
|address_2           | string              | null: false                    |
|phone_number        | integer             | null: false                    |

### Association
belongs_to :item_log 
belongs_to :prefecture



## item_logs
| Column             | Type                | Options                                      |
|--------------------|---------------------|----------------------------------------------|
|item                |references           | null: false, foreign_key: true, unique: true |
|delivery            |references           | null: false, foreign_key: true               |
|user                |references           | null: false, foreign_key: true               |

### Association
belongs_to :item
belongs_to :user
has_one :delivery