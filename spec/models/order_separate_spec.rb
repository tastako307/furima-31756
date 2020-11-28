require 'rails_helper'

RSpec.describe OrderSeparate, type: :model do
  before do
    @order = FactoryBot.build(:order_separate)
  end
  describe '購入処理' do
    it '正規登録' do
      expect(@order).to be_valid
    end

    it '郵便番号が空白では登録できない' do
      @order.post_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Post number 例：123-3456 郵便番号は左のように入力してください。なお、この項目の入力は全て半角で入力を行います")
    end

    it '郵便番号は文字が入っては登録出来ない' do
      @order.post_number = '一二三-四五六七'
      @order.valid?
      expect(@order.errors.full_messages).to include("Post number 例：123-3456 郵便番号は左のように入力してください。なお、この項目の入力は全て半角で入力を行います")
    end

    it '郵便番号は数字だけでは登録ができない' do
      @order.post_number = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include("Post number 例：123-3456 郵便番号は左のように入力してください。なお、この項目の入力は全て半角で入力を行います")
    end

    it '郵便番号が全角では登録できない' do
      @order.post_number = '１２３−４５６７'
      @order.valid?
      expect(@order.errors.full_messages).to include("Post number 例：123-3456 郵便番号は左のように入力してください。なお、この項目の入力は全て半角で入力を行います")
    end

    it '都道府県が空白では登録できない' do
      @order.prefecture_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture 都道府県の入力は必須です")
    end

    it '市区町村が空白では登録できない' do
      @order.address_1 = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Address 1 市区町村の入力は必須です")
    end

    it '番地が空白では登録できない' do
      @order.address_2 = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Address 2 番地の入力は必須です")
    end

    it '電話番号が空白では登録できない' do
      @order.phone_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number 電話番号は、0から始まる10桁、または11桁の半角数字だけで入力してください")
    end

    it '電話番号が０から始まらないと登録できない' do
      @order.phone_number = '1234567890'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number 電話番号は、0から始まる10桁、または11桁の半角数字だけで入力してください")
    end

    it '電話番号が全角文字では登録できない' do
      @order.phone_number = '０１２３４５６７８９'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number 電話番号は、0から始まる10桁、または11桁の半角数字だけで入力してください")
    end

    it '電話番号にハイフンが入っては登録出来ない' do
      @order.phone_number = '090-1234-5678'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number 電話番号は、0から始まる10桁、または11桁の半角数字だけで入力してください")
    end

    it '電話番号は桁数を間違えては登録出来ない' do
      @order.phone_number = '090234567'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number 電話番号は、0から始まる10桁、または11桁の半角数字だけで入力してください")
    end

    it '電話番号が全角文字では登録できない' do
      @order.phone_number = '〇一二三四五六七八九'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number 電話番号は、0から始まる10桁、または11桁の半角数字だけで入力してください")
    end

    it 'トークンが生成されていないと登録出来ない' do
      @order.token = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Token クレジットカードカードの情報は半角数字で入力する必要があります")
    end

  end
end
