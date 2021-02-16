require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id)
    sleep 0.1 
  end

  describe '商品購入機能' do
    context '購入できるとき' do
      it 'すべての値が正しく入力されていればが存在していれば保存できること' do
        expect(@record_address).to be_valid
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式であれば保存できること' do
        @record_address.postal_code = '123-4567'
        expect(@record_address).to be_valid
      end
      it 'phone_numberが11桁以内の数字だと保存できること' do
        @record_address.phone_number = '18012345678'
        expect(@record_address).to be_valid
      end
      it 'building_nameがなくても保存できること' do
        @record_address.building_name = ''
        expect(@record_address).to be_valid
      end
    end

    context '購入できないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @record_address.postal_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @record_address.postal_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'cityが空だと保存できないこと' do
        @record_address.city = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @record_address.address = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @record_address.phone_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁より多い数字だと保存できないこと' do
        @record_address.phone_number = '180123456789'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberは英数混合では保存できないこと' do
        @record_address.phone_number = 'abc123456789'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number Input only number')
      end
      it 'user_idが空だと保存できないこと' do
        @record_address.user_id = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できないこと' do
        @record_address.item_id = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'prefecture_idが1では保存できないこと' do
        @record_address.prefecture_id = 1
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Prefecture Select')
      end
      it 'tokenが空だと保存できないこと' do
        @record_address.token = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
