require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it '項目全て記入すれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'productが空では保存できない' do
        @item.product = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Product can't be blank"
      end
      it 'explanationが空では保存できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'category_idが空では保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank", "Category is not a number"
      end
      it 'category_idが1では保存できない' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it 'status_idが空では保存できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank", "Status is not a number"
      end
      it 'status_idが1では保存できない' do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Status must be other than 1"
      end
      it 'burden_idが空では保存できない' do
        @item.burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Burden can't be blank", "Burden is not a number"
      end
      it 'burden_idが1では保存できない' do
        @item.burden_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Burden must be other than 1"
      end
      it 'prefecture_idが空では保存できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank", "Prefecture is not a number"
      end
      it 'prefecture_idが1では保存できない' do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it 'day_idが空では保存できない' do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Day can't be blank", "Day is not a number"
      end
      it 'day_idが1では保存できない' do
        @item.day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Day must be other than 1"
      end
      it 'priceが空では保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank","Price is invalid","Price is not a number"
      end
      it 'priceが300より少額では保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it 'priceが9999999より多額では保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
    end
  end

end
