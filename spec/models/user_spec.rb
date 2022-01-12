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
      expect(another_user.errors.full_messages).to include("Email has already been taken")
     end
     it 'メールアドレスに＠を含まない場合は登録できない' do
     @user.email = 'freegmail.com'
     @user.valid?
     expect(@user.errors.full_messages).to include("Email is invalid")
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
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end
     it '英字のみのパスワードでは登録できない' do
      @user.password = 'asdifhij'
      @user.password_confirmation = 'asdifhij'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
     end
     it '数字のみのパスワードでは登録できない' do
      @user.password = '45979570'
      @user.password_confirmation = '45979570'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
     end
     it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'ＡＢｃ１２３'
      @user.password_confirmation = 'ＡＢｃ１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
     end
     it '姓（全角）が空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
     end
     it '姓（全角）に半角文字が含まれていると登録できない' do
     @user.first_name = 'kouzi'
     @user.valid?
     expect(@user.errors.full_messages).to include("First name is invalid")
     end
     it '名（全角）が空だと登録できない' do
     @user.last_name = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
     end
     it '名（全角）に半角文字が含まれていると登録できない' do
     @user.last_name = 'kouzi'
     @user.valid?
     expect(@user.errors.full_messages).to include("Last name is invalid")
     end
     it '姓（カナ）が空だと登録できない' do
     @user.firstkana_name = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Firstkana name can't be blank", "Firstkana name is invalid")
     end
     it '姓（カナ）にカタカナ以外の文字が含まれていると登録できない' do
     @user.firstkana_name = 'kouzi'
     @user.valid?
     expect(@user.errors.full_messages).to include("Firstkana name is invalid")
     end
     it '名（カナ）が空だと登録できない' do
     @user.lastkana_name = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Lastkana name can't be blank", "Lastkana name is invalid")
     end
     it '名（カナ）にカタカナ以外の文字が含まれていると登録できない' do
     @user.lastkana_name = 'kouzi'
     @user.valid?
     expect(@user.errors.full_messages).to include("Lastkana name is invalid")
     end
     it '生年月日が空だと登録できない' do
     @user.birth_date = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Birth date can't be blank")
     end
    end
   end
end
