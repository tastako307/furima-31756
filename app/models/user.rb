class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :encrypted_password, format: { with: /\A([a-z]{1, 127})([\d]{1, 127})\z/, message: "アルファベット・数字を最低でも１文字以上入れてください"}
  validates :nickname,           presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A(ァ-ンー)+\z/, message: '全角カタカナを使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end
  
  validates :birthday,           presence: true

end
