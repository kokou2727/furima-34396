require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できるとき' do
      it 'imageとtitleとdescriptionとcategory_idとfee_idとshipping_date_idとfrom_idとstate_idとpriceとuser_idが存在していれば保存できること' do
        expect(@item).to be_valid
      end
      it '販売価格は半角数字であれば保存できること' do
        @item.price = 1000
        expect(@item).to be_valid
      end
      it '販売価格は、¥300~の間であれば保存できること' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it '販売価格は、~¥9,999,999の間であれば保存できること' do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it 'imageが空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では保存できないこと' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'descriptionが空では保存できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'priceが空では保存できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'category_idが1では保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'fee_idが1では保存できないこと' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee Select')
      end
      it 'shipping_date_idが1では保存できないこと' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping date Select')
      end
      it 'from_idが1では保存できないこと' do
        @item.from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('From Select')
      end
      it 'state_idが1では保存できないこと' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('State Select')
      end
      it '販売価格は半角数字でなければ保存できないこと' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it '販売価格は、¥300~でなければ保存できないこと' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it '販売価格は、~¥9,999,999でなければ保存できないこと' do
        @item.price = 100000000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
