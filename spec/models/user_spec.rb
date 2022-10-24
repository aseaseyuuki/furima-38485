require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
      it "内容に問題ない場合" do
        expect(@user).to be_valid
      end
  
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include"Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "passwordが存在してもencrypted_passwordが空では登録できない" do
      @user.encrypted_password  = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Encrypted password can't be blank"
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
        it 'passwordが半角英語のみのときに登録できないこと' do
          @user.password = 'abcdef'
          @user.password_confirmation = 'abcdef'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
        end
        it 'passwordが全角文字を含むパスワードでは登録できない' do
          @user.password = 'ああああああ'
          @user.password_confirmation = 'ああああああ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
        end
    it "生年月日が空だと登録できない" do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
    end
    it 'family_nameが半角では登録できない' do
      @user.family_name = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name is invalid"
    end
    it 'first_nameが半角では登録できない' do
      @user.first_name = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it 'family_name_kanaが半角カタカナでは登録できない' do
      @user.family_name_kana = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana is invalid"
    end
    it 'first_name_kanaが半角カタカナでは登録できない' do
      @user.first_name_kana = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end
  end
end