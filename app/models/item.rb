class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :deadline
  belongs_to :category
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :fee

  validates :image, presence: { message: '画像ファイルの添付は必須です' }
  validates :price, numericality: { \
    only_integer: true,\
    greater_than_or_equal_to: 300,\
    less_than_or_equal_to: 9_999_999,\
    message: '価格の入力は、300〜9999999の範囲内の整数かつ、半角英数字で行う必要があります'
  }

  validates :name,  presence: { message: '商品名の入力は必須です' },\
                    length: { maximum: 40, message: '商品名に入力できるのは40文字までです' }
  validates :text,  presence: { message: '説明文の入力は必須です' },\
                    length: { maximum: 1000, message: '説明文に入力できるのは1000文字までです' }

  with_options presence: { message: 'プルダウンから選択して値を入力してください' } do
    validates :deadline_id
    validates :category_id
    validates :prefecture_id
    validates :condition_id
    validates :fee_id
  end
end
