require 'rails_helper'

RSpec.describe Item, type: :model do
     describe '出品商品の保存' do
       before do
         @item = FactoryBot.build(:item)
         
       end
  
       context '出品がうまくいくとき' do
         it '全ての値が正しく入力されていたら保存できること' do
           expect(@item).to be_valid
         end
       end
  
       context '出品がうまくいかないとき' do
         it 'imageが空だと保存できないこと' do
           @item.image = nil
           @item.valid?
           expect(@item.errors.full_messages).to include("Image can't be blank")
         end
  
         it 'nameが空だと保存できないこと' do
           @item.name = nil
           @item.valid?
           expect(@item.errors.full_messages).to include("Name can't be blank")
         end

         it 'descriptionが空だと保存できないこと' do
          @item.description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
         end

  
         it 'priceが空だと保存できないこと' do
           @item.price = nil
           @item.valid?
           expect(@item.errors.full_messages).to include("Price can't be blank")
         end
  
         it 'category_idが空だと保存できないこと' do
           @item.category_id = nil
           @item.valid?
           expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
         end
  
         it 'products_status_idが空だと保存できないこと' do
           @item.products_status_id = nil
           @item.valid?
           expect(@item.errors.full_messages).to include("Products status can't be blank", 'Products status is not a number')
         end
  
         it 'shipping_charge_idが空だと保存できないこと' do
           @item.shipping_charge_id = nil
           @item.valid?
           expect(@item.errors.full_messages).to include("Shipping charge can't be blank", 'Shipping charge is not a number')
         end
  
         it 'shipping_area_idが空だと保存できないこと' do
           @item.shipping_area_id = nil
           @item.valid?
           expect(@item.errors.full_messages).to include("Shipping area can't be blank", 'Shipping area is not a number')
         end
  
         it 'condition_idが空だと保存できないこと' do
           @item.condition_id = nil
           @item.valid?
           expect(@item.errors.full_messages).to include("Condition can't be blank", 'Condition is not a number')
         end
  
         it 'priceが、¥300より安いと保存できないこと' do
           @item.price = 299
           @item.valid?
           expect(@item.errors.full_messages).to include('Price must be greater than 300')
         end
  
         it 'priceが、¥9,999,999より高いと保存できないこと' do
           @item.price = 10000000
           @item.valid?
           expect(@item.errors.full_messages).to include('Price must be less than 9999999')
         end
  
         it 'priceは半角数字のみの入力で保存できること' do
           @item.price = 'だめ'
           @item.valid?
           expect(@item.errors.full_messages).to include('Price is not a number')
         end

         it 'priceには"半角英数混合では登録できないこと' do
           @item.price = '100a0'
           @item.valid?
           expect(@item.errors.full_messages).to include('Price is not a number')
         end

         it 'category_idが1では登録できないこと' do
           @item.category_id = 1
           @item.valid?
           expect(@item.errors.full_messages).to include('Category must be other than 1')
         end

         it 'condition_idが1では登録できないこと' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Condition must be other than 1')
        end
      
        it 'shipping_charge_idが1では登録できないこと' do
          @item.shipping_charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping charge must be other than 1')
        end

        it 'shipping_area_idが1では登録できないこと' do
          @item.shipping_area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping area must be other than 1')
        end

        it 'products_status_idが1では登録できないこと' do
          @item.products_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Products status must be other than 1')
        end

       end
     end
  end