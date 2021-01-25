require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '商品購入機能' do
    context '商品を購入できるとき' do
      it 'すべての情報を入れると購入できる' do
        expect(@order_form).to be_valid
      end
      it '建物名以外のすべての情報を入れると購入できる' do
        @order_form.building = nil
        expect(@order_form).to be_valid
      end
    end

    context '購入できないとき' do
      it 'クレジットカード情報が空では購入できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では購入できない' do
        @order_form.postcode = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号は-(ハイフン)がないと購入できない' do
        @order_form.postcode = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it '郵便番号は全角数字では購入できない' do
        @order_form.postcode = '１２３−４５６７'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it '都道府県が空(---)では購入できない' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空では購入できない' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では購入できない' do
        @order_form.block = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Block can't be blank")
      end
      it '電話番号が空では購入できない' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は全角数字では購入できない' do
        @order_form.phone_number = '０９０１２３４５６７８'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号は11桁以上では購入できない' do
        @order_form.phone_number = '090456789012'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号は-(ハイフン)を付けると購入できない' do
        @order_form.phone_number = '090-1234-5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end

      it 'user_idが空だと購入できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと購入できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
