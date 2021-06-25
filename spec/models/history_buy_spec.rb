require 'rails_helper'

RSpec.describe HistoryBuy, type: :model do
  describe '配送先の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @history_buy = FactoryBot.build(:history_buy, user_id: user.id, item_id: item.id)
      sleep 0.5
    end
    context '保存がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@history_buy).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @history_buy.building = nil
        expect(@history_buy).to be_valid
      end
      it 'post_codeはハイフンが入った郵便番号であればできること' do
        @history_buy.post_code
        expect(@history_buy).to be_valid
      end
    end
    context '保存がうまくいかないとき' do
      it 'post_codeが空だと保存できないこと' do
        @history_buy.post_code = nil
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include("Post code can't be blank")
      end
      it 'shipping_area_idが空だと保存できないこと' do
        @history_buy.shipping_area_id = nil
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @history_buy.city = nil
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @history_buy.address = nil
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @history_buy.phone_number = nil
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @history_buy.token = nil
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが半角数字のハイフン入りの郵便番号でなければ保存できないこと' do
        @history_buy.post_code = '333jjjj'
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeが半角数字3桁、ハイフン、半角数字4桁の状態（例：111-1111）でないと保存できないこと' do
        @history_buy.post_code = '333-jjj'
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'phone_numberが半角10桁、11桁の数字でなければ保存できないこと' do
        @history_buy.phone_number = '123456789012'
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'phone_numberがハイフン入りでは保存できないこと' do
        @history_buy.phone_number = '123-456-890'
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include("Phone number is invalid.")
      end
    end
  end
end

    