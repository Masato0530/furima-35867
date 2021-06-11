require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録機能' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_name_kanaとlast_name_kana、birthdayが存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できること' do
        @user.password
        @user.password_confirmation
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailは@を含むこと' do
        @user.email = 'nbrmcisample.com'
        @user.valid?
        expect(@user.errors[:email]).to include("is invalid")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it "passwordは英数字混合でないと登録できない" do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it "passwordは英数字混合でないと登録できない" do
        @user.password = "eeeeee"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it "passwordは英数字混合でないと登録できない" do
        @user.password = "１１ａａａ１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end

      it 'first_nameが空では登録出来ないこと' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      
      it 'first_name_kanaが空では登録出来ないこと' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      

      it 'last_nameが空では登録出来ないこと' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_name_kanaが空では登録出来ないこと' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'birthdayが空では登録出来ないこと' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = 'nbr123'
        @user.valid?
        expect(@user.errors[:first_name]).to include("is invalid. Input full-width characters.")
      end

      it 'last_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.last_name = 'nbr123'
        @user.valid?
        expect(@user.errors[:last_name]).to include("is invalid. Input full-width characters.")
      end

      it 'first_name_kanaは全角（カタカナ）でなければ登録できない' do
        @user.first_name_kana = 'かたかな'
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include("is invalid. Input full-width katakana characters.")
      end

      it 'last_name_kanaは全角（カタカナ）でなければ登録できない' do
        @user.last_name_kana = 'かたかな'
        @user.valid?
        expect(@user.errors[:last_name_kana]).to include("is invalid. Input full-width katakana characters.")
      end

      it 'last_name_kanaは半角文字だと登録できない' do
        @user.last_name_kana = 'ｶﾀｶﾅ'
        @user.valid?
        expect(@user.errors[:last_name_kana]).to include("is invalid. Input full-width katakana characters.")
      end

      it 'first_name_kanaは半角文字だと登録できない' do
        @user.first_name_kana = 'ｶﾀｶﾅ'
        @user.valid?
        expect(@user.errors[:last_name_kana]).to include("is invalid. Input full-width katakana characters.")
      end
    end
  end
end
