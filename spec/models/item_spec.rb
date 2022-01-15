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
      it 'category_idが空だと登録できない' do
        @item.category_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include "Category is not a number"
      end
      it 'state_idが空だと登録できない' do
        @item.state_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include "State is not a number"
      end
      it 'shipping_fee_idが空だと登録できない' do
        @item.shipping_fee_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee is not a number"
      end
      it 'prefecture_idが空だと登録できない' do
        @item.prefecture_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture is not a number"
      end
      it 'shipping_day_idが空だと登録できない' do
        @item.shipping_day_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day is not a number"
      end
      it 'priceが空だと登録できない' do
        @item.price = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include 
      end
    end
  end
end
