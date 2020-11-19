class Item < ApplicationRecord
  belongs_to :user 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :send
  belongs_to :category
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :fee

end
