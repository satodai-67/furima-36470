require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

   describe "ユーザー新規登録" do  
    context '新規登録できるとき' do
     it 'nickname、email、password、姓名、姓名（カナ）、生年月日が存在すれば登録できる' do
      expect(@user).to be_valid
     end
    end

    context '新規登録できないとき' do
     it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
     end
     it 'emailが空では登録できない' do
      @user.email = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
     end
     it '重複したメールアドレスでは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
     end
     it 'メールアドレスに＠を含まない場合は登録できない' do
     end
     it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '000000'
      @user.password_confirmation = '0000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it 'パスワードが6文字未満では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
     end
     it '英字のみのパスワードでは登録できない' do
      @user.password = 'aaaaaaaa'
      @user.password_confirmation = 'aaaaaaaa'
      @user.valid?
     end
     it '数字のみのパスワードでは登録できない' do
      @user.password = '00000000'
      @user.password_confirmation = '00000000'
      @user.valid?
     end
     it '全角文字を含むパスワードでは登録できない' do
      @user.password = '０００００００'
      @user.password_confirmation = '０００００００'
      @user.valid?
     end
     it '姓（全角）が空だと登録できない' do
      @user.first_name = ''
      @user.valid?
     end
     it '姓（全角）に半角文字が含まれていると登録できない' do
     @user.first_name = 'ﾊﾝｶｸﾓｼﾞ'
     @user.valid?
     end
     it '名（全角）が空だと登録できない' do
     @user.last_name = ''
     @user.valid?
     end
     it '名（全角）に半角文字が含まれていると登録できない' do
     @user.last_name = 'ﾊﾝｶｸﾓｼﾞ'
     @user.valid?
     end
     it '姓（カナ）が空だと登録できない' do
     @user.firstkana_name = ''
     @user.valid?
     end
     it '姓（カナ）にカタカナ以外の文字が含まれていると登録できない' do
     @user.firstkana_name = 'さとう'
     @user.valid?
     end
     it '名（カナ）が空だと登録できない' do
     @user.lastkana_name = ''
     @user.valid?
     end
     it '名（カナ）にカタカナ以外の文字が含まれていると登録できない' do
     @user.lastkana_name = 'ゴロウ'
     @user.valid?
     end
     it '生年月日が空だと登録できない' do
     @user.birth_date = ''
     @user.valid?
     end
    end
   end
end
