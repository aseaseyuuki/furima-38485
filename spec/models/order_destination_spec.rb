require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_destination).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @order_destination.building_name = ''
        expect(@order_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_destination.post_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Post code can't be blank"
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_destination.post_code = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Post code is invalid. Include hyphen(-)"
      end
      it 'shipping_originが--では登録できない' do
        @order_destination.shipping_origin_id = 1
        @order_destination.valid?
        expect( @order_destination.errors.full_messages).to include 
      end
      it 'cityが空だと保存できないこと' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "City can't be blank"
      end
      it 'addressが空だと保存できないこと' do
        @order_destination.address = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが半角数値で10桁以下だと保存できないこと' do
        @order_destination.phone_number = '123456789'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Phone number is invalid"
      end
      it 'phone_numberが半角数値で11桁以上だと保存できないこと' do
        @order_destination.phone_number = '012345678900'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Phone number is too long (maximum is 11 characters)"
      end
      it 'userが空だと保存できないこと' do
        @order_destination.user_id = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐付いていないと保存できないこと' do
         @order_destination.item_id = ''
         @order_destination.valid?
         expect(@order_destination.errors.full_messages).to include "Item can't be blank"
      end
      it "tokenが空では登録できないこと" do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Token can't be blank"
      end
      # it "priceが空では保存ができないこと" do
        # @order_destination.price =''
        # @order_destination.valid?
        # @expect(@order_address.errors.full_messages).to include("Price can't be blank")
      # end
    end
  end
end
