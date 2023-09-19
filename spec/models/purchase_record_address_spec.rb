require 'rails_helper'

RSpec.describe PurchaseRecordAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      sleep(1)
      @item = FactoryBot.create(:item)
      sleep(1)
      @purchase_record_address = FactoryBot.build(:purchase_record_address, user_id: @user.id, item_id: @item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_record_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_record_address.building = ''
        expect(@purchase_record_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_cordが空だと保存できないこと' do
        @purchase_record_address.post_cord = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Post cord can't be blank")
      end
      it 'post_cordが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_record_address.post_cord = '1234567'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('Post cord is invalid. Include hyphen(-)')
      end
      it 'region_idを選択していないと保存できないこと' do
        @purchase_record_address.region_id = 1
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Region can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @purchase_record_address.city = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空だと保存できないこと' do
        @purchase_record_address.street = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Street can't be blank")
      end
      it 'telephoneが空だと保存できないこと' do
        @purchase_record_address.telephone = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneがハイフンを含んでいると保存できないこと' do
        @purchase_record_address.telephone = '090-1234-5678'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('Telephone is invalid')
      end
      it 'telephoneが9文字以下だと保存できないこと' do
        @purchase_record_address.telephone = '090123456'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('Telephone is invalid')
      end
      it 'telephoneが12文字以上だと保存できないこと' do
        @purchase_record_address.telephone = '090123456789'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('Telephone is invalid')
      end
      it 'telephoneが全角数字だと保存できないこと' do
        @purchase_record_address.telephone = '０９０１２３４５６７８'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('Telephone is invalid')
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_record_address.user_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_record_address.item_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @purchase_record_address.token = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
