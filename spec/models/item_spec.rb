require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do

    it '正常に出品できる' do
      expect(@item).to be_valid
    end

    it 'Userが空では登録出来ない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist') 
    end

    it 'category_idが空では登録できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category プルダウンから選択して値を入力してください')
    end

    it 'condition_idが空では登録できない' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition プルダウンから選択して値を入力してください')
    end

    it 'deadline_idが空では登録できない' do
      @item.deadline_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Deadline プルダウンから選択して値を入力してください')
    end

    it 'fee_idが空では登録できない' do
      @item.fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Fee プルダウンから選択して値を入力してください')
    end

    it 'prefecture_idが空では登録できない' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture プルダウンから選択して値を入力してください')
    end

    it 'priceが空では登録出来ない' do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 価格の入力は、300〜9999999の範囲内の整数かつ、半角英数字で行う必要があります')
    end

    it 'priceが大きすぎては登録出来ない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 価格の入力は、300〜9999999の範囲内の整数かつ、半角英数字で行う必要があります')
    end

    it 'priceが小さすぎては登録出来ない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 価格の入力は、300〜9999999の範囲内の整数かつ、半角英数字で行う必要があります')
    end

    it 'priceに数字以外が入っては登録出来ない' do
      @item.price = 'aaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 価格の入力は、300〜9999999の範囲内の整数かつ、半角英数字で行う必要があります')
    end

    it 'nameが空では登録出来ない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Name 商品名の入力は必須です')
    end

    it 'nameの文字数が多すぎては登録出来ない' do
      @item.name = Faker::String.random(length: 50)
      @item.valid?
      expect(@item.errors.full_messages).to include('Name 商品名に入力できるのは40文字までです')
    end

    it 'textが空では登録出来ない' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Text 説明文の入力は必須です')
    end

    it 'textの文字数が多すぎては登録出来ない' do
      @item.text = Faker::String.random(length: 1100)
      @item.valid?
      expect(@item.errors.full_messages).to include('Text 説明文に入力できるのは1000文字までです')
    end

  end
end
