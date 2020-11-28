class OrderSeparate
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :prefecture_id, :post_number, :address_1, :address_2,\
               :building, :phone_number, :token

  validates :post_number, format: { with: /\A\d{3}[-]\d{4}\z/, message: '例：123-3456 郵便番号は左のように入力してください。なお、この項目の入力は全て半角で入力を行います'}
  validates :prefecture_id, presence: { message: "都道府県の入力は必須です" }
  validates :address_1, presence: { message:  "市区町村の入力は必須です"}
  validates :address_2, presence: { message: "番地の入力は必須です" }
  validates :phone_number, format: { with: /\A0[0-9]{9,10}\z/, message: '電話番号は、0から始まる10桁、または11桁の半角数字だけで入力してください'}
  validates :token, presence: { message: 'クレジットカードカードの情報は半角数字で入力する必要があります'}

  def save
    Order.create( user_id: user_id, item_id: item_id )
    Delivery.create( prefecture_id: prefecture_id, post_number: post_number,\
                     address_1: address_1, address_2: address_2, building: building,\
                     phone_number: phone_number, order_id: Order.find_by(item_id: item_id).id )
  end

end