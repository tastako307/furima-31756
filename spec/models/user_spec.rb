require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  after do
    if @user.errors.any?
      puts @user.errors.full_messages
      puts @user.password
    end
  end
  describe 'ユーザー新規登録' do
    it '@userが正常に登録できる' do
      expect(@user).to be_valid
    end
    it 'emailが空では登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailが重複すると登録できない' do
      user = FactoryBot.build(:user)
      user.email = @user.email
      @user.save
      user.valid?
      expect(user.errors.full_messages).to include("Email 指定したメールアドレスは既に登録されています")
    end
    it 'passwordが空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが数字だけでは登録できない' do
      @user.password = "12345678"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password パスワードには最低でもアルファベットと数字を一文字づつ含めてください")
    end
    it 'passwordがアルファベットだけでは登録できない' do
      @user.password = "asdfghjk"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password パスワードには最低でもアルファベットと数字を一文字づつ含めてください")
    end
    it 'passwordが一致していないと登録できない' do
      @user.password = "aaaaa"
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '' do
    end
  end
end
