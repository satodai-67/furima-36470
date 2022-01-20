require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id)
    end

    context '商品が購入できるとき' do
      it '全てのデータが存在すれば商品が購入できる' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it 'postal_codeが空だと購入できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが空だと購入できない' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空だと購入できない' do
        @purchase_address.municipalities = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'house_numberが空だと購入できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空だと購入できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていないと購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
