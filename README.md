# README

## user
| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| nickname           | string              | null: false             |
| last_name          | string              | null: false             |
| first_name         | string              | null: false             |
| last_name_kana     | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birthday           | date                | null: false             |

### Association
has_many :item
has_many :item, through :item_log
has_many :delivery

## items
| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
|user_id             |references           | null: false, foreign_key: true |
|category_id         |references           | null: false, foreign_key: true |
|brand_id            |references           | null: false, foreign_key: true |
|prefecture_id       |references           | null: false, foreign_key: true |
|condition_id        |references           | null: false, foreign_key: true |
|fee_id              |references           | null: false, foreign_key: true |
|price               |integer              | null: false                    |
|name                |string               | null: false                    |
|image               |                     | (null:false)                   |
|text                |text                 | null: false                    |

### Association
belongs_to :user, :category, :brand, :prefecture, :condition, :fee
has_many :user  through :item_log
has_one_attached :image

## deliverys

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
|prefecture_id       | references          | null: false, foreign_key: true |
|user_id             | references          | null: false, foreign_key: true |
|item_log_id         | references          | null: false, foreign_key: true |
|address_1           | string              | null: false                    |
|address_2           | string              | null: false                    |

### Association
belongs_to :user, :item_log, prefecture



## item_logs
| Column             | Type                | Options                                      |
|--------------------|---------------------|----------------------------------------------|
|item_user_id        |references           | null: false, foreign_key: true               |
|item_id             |references           | null: false, foreign_key: true, unique: true |
|delivery_id         |references           | null: false, foreign_key: true               |
|user_id             |references           | null: false, foreign_key: true               |

### Association
belongs_to :item, :user
has_one :delivery