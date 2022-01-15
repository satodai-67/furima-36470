require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品出品機能" do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品できるとき' do
      it '全てのデータが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'item_nameが空だと登録できない' do
        @item.item_name = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'item_explanationが空だと登録できない' do
        @item.item_explanation = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include "Item explanation can't be blank"
      end
      it 'category_idが--だと登録できない' do
        @item.category_id = '1'  
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it 'state_idが--だと登録できない' do
        @item.state_id = '1'  
        @item.valid?
        expect(@item.errors.full_messages).to include "State must be other than 1"
      end
      it 'shipping_fee_idが--だと登録できない' do
        @item.shipping_fee_id = '1'  
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee must be other than 1"
      end
      it 'prefecture_idが--だと登録できない' do
        @item.prefecture_id = '1'  
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it 'shipping_day_idが--だと登録できない' do
        @item.shipping_day_id = '1'  
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day must be other than 1"
      end
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = '８８８'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it '販売価格が¥300より少ない時は出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it '販売価格が¥9999999より多い時は出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it 'userが紐づいていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end
