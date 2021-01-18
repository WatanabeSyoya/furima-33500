require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できるとき' do
      it 'すべての情報を入れると出品できる' do
        @item
        expect(@item).to be_valid
      end
      it '価格は300円以上であれば出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it '価格は9,999,999円以下であれば出品できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it '価格は299円以下は出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格は10,000,000円以上は出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '商品画像が空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がないと出品できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "カテゴリーが'---'だと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it "商品の状態が'---'だと出品できない" do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item condition must be other than 1')
      end
      it "配送料の負担が'---'だと出品できない" do
        @item.shipping_charges_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charges must be other than 1')
      end
      it "発送元の地域が'---'だと出品できない" do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it "発送までの日数が'---'だと出品できない" do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship must be other than 1')
      end
      it '価格が空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が全角数字だと出品できない' do
        @item.price = '１１１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格が半角英数混合だと出品できない' do
        @item.price = "a3b21"
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格が半角英語だと出品できない' do
        @item.price = "aaaaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
