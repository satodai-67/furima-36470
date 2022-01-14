require 'rails_helper'

RSpec.describe Item, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  describe "商品出品機能" do
    context '商品出品できるとき' do
      it '全てのデータが存在すれば登録できる' do
      expect(@item).to ba_valid
      end
    end

    context '商品出品できないとき' do
      it "imageが空だと登録できない" do
      end
      it 'item_nameが空だと登録できない' do
      end
      it 'item_explanationが空だと登録できない' do
      end
      it 'categoryが空だと登録できない' do
      end
      it 'stateが空だと登録できない' do
      end
      it 'shipping_feeが空だと登録できない' do
      end
      it 'prefectureが空だと登録できない' do
      end
      it 'shipping_dayが空だと登録できない' do
      end
      it 'priceが空だと登録できない' do
      end
    end
end
