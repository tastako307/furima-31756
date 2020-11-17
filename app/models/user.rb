class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email,              uniqueness: {message: "指定したメールアドレスは既に登録されています"}           
  validates :password,           format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "パスワードには最低でもアルファベットと数字を一文字づつ含めてください"}
  validates :nickname,           presence: {message: "ニックネームを入力してください"}
  validates :birthday,           presence: {message: "誕生日を入力してください"}

  with_options presence: true,   format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true,   format: { with: /\A[ァ-ン]+\z/, message: '全角カタカナを使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end

end
