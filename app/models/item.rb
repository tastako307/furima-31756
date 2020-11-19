class Item < ApplicationRecord
  belongs_to :user 
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :send
  belongs_to :category
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :fee

end
