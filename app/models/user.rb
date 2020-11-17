class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :encrypted_password, format: { with: /\A([a-z]{1, 127})([\d]{1, 127})\z/, message: "アルファベット・数字を最低でも１文字以上入れてください"}
  validates :nickname,           presence: true
  validates :first_name,         presence: true
  validates :last_name,          presence: true
  validates :first_name_kana,    presence: true
  validates :last_name_kana,     presence: true
  validates :birthday,           presence: true

end
