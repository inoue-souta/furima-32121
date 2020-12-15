require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'tokenが空では保存できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Token can't be blank"
      end
      it 'postal_codeが空では保存できない' do
        @purchase_address.postal_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code can't be blank", "Postal code is invalid"
      end
      it 'postal_codeがハイフン無しでは保存できない' do
        @purchase_address.postal_code = "1234567"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code is invalid"
      end
      it 'postal_codeが3桁-4桁以外では保存できない' do
        @purchase_address.postal_code = "1234-4567"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code is invalid"
      end
      it 'prefecture_idが1では保存できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it 'municipalityが空では保存できない' do
        @purchase_address.municipality = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Municipality can't be blank"
      end
      it 'addressが空では保存できない' do
        @purchase_address.address = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_numberが空では保存できない' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number can't be blank", "Phone number is invalid"
      end
      it 'phone_numberがハイフンありでは保存できない' do
        @purchase_address.phone_number = "090-1234-1234"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number is invalid"
      end
      it 'phone_numberが11桁以外では保存できない' do
        @purchase_address.phone_number = "123456789012"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number is invalid"
      end
    end
  end

end


