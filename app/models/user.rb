class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email,              uniqueness: {message: "指定したメールアドレスは既に登録されています"}           
  validates :encrypted_password, format: { with: /\A([a-z]{1, 127})([\d]{1, 127})\z/, message: "アルファベット・数字を最低でも１文字以上入れてください"}
  validates :nickname,           presence: {message: "ニックネームを入力してください"}
  validates :birthday,           presence: {message: "誕生日を入力してください"}

  with_options presence: true,   format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true,   format: { with: /\A(ァ-ンー)+\z/, message: '全角カタカナを使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end

end
