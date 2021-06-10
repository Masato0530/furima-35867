require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録機能' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、encrypted_passwordとencrypted_password_confirmation、first_nameとlast_name、first_name_kanaとlast_name_kana、birthdayが存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'encrypted_passwordが6文字以上であれば登録できること' do
        @user.encrypted_password
        @user.encrypted_password_confirmation
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

      it 'encrypted_passwordが空では登録できないこと' do
        @user.encrypted_password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'encrypted_passwordが存在してもencrypted_password_confirmationが空では登録できないこと' do
        @user.encrypted_password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Encrypted_password confirmation doesn't match Encrypted_password")
      end

      it 'first_nameが空では登録出来ないこと' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameが空では登録出来ないこと' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが存在してもlast_nameが空では登録できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_name_kanaが空では登録出来ないこと' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name pkey can't be blank")
      end

      it 'last_name_kanaが空では登録出来ないこと' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name pkey can't be blank")
      end

      it 'first_name_kanaが存在してもlast_name_pkeyが空では登録できないこと' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name pkey can't be blank")
      end

      it 'birthdayが空では登録出来ないこと' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'encrypted_passwordが5文字以下であれば登録できないこと' do
        @user.encrypted_password = '12345'
        @user.encrypted_password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Encrypted_password is too short (minimum is 6 characters)')
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
    end
  end
end
