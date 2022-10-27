require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
  @item = FactoryBot.build(:item)
  end

describe '商品出品機能' do
  context '内容に問題がある場合' do
  it 'nameが空では登録できない' do
    @item.name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Name can't be blank"
  end
  it 'descriptionが空では登録できない' do
    @item.description = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Description can't be blank"
  end
  it 'categoryが未選択では登録できない' do
    @item.category_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include "Category can't be blank"
  end
  it 'statusが未選択では登録できない' do
    @item.status_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include "Status can't be blank"
  end
  it 'delivery_chargeが未選択では登録できない' do
    @item.delivery_charge_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include "Delivery charge can't be blank"
  end
  it 'shipping_originが未選択では登録できない' do
    @item.shipping_origin_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include "Shipping origin can't be blank"
  end
  it 'shipping_dayが未選択では登録できない' do
    @item.shipping_day_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include "Shipping day can't be blank"
  end
  it 'priceが空では登録できない' do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include "Price can't be blank"
  end

  it '画像が空だと登録できない' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include "Image can't be blank"
  end
end
end
end