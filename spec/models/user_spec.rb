require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_furiganaとlast_furigana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailに@があれば登録できる' do
        @user.email = 'aaa@111'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'passwordは半角英数が混合で使われていればでは登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'first_nameは全角（漢字・ひらがな・カタカナ）で入力されていれば登録できる' do
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end
      it 'last_nameは全角（漢字・ひらがな・カタカナ）で入力されていれば登録できる' do
        @user.last_name = '山田'
        expect(@user).to be_valid
      end
      it 'first_furiganaは全角（カタカナ）で入力されていれば登録できる' do
        @user.first_furigana = 'タロウ'
        expect(@user).to be_valid
      end
      it 'last_furiganaは全角（カタカナ）で入力されていれば登録できる' do
        @user.last_furigana = 'ヤマダ'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'aaa111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'ab000'
        @user.password_confirmation = 'ab000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数が混合で使われていなければでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'passwordは半角数字のみでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'passwordは全角では登録できない' do
        @user.password = 'AAA１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_furiganaが空では登録できない' do
        @user.first_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana can't be blank")
      end
      it 'last_furiganaが空では登録できない' do
        @user.last_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last furigana can't be blank")
      end
      it 'first_nameは全角（漢字・ひらがな・カタカナ）で入力されていないと登録できない' do
        @user.first_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end
      it 'last_nameは全角（漢字・ひらがな・カタカナ）で入力されていないと登録できない' do
        @user.last_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")
      end
      it 'first_furiganaは全角（カタカナ）で入力されていないと登録できない' do
        @user.first_furigana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana Full-width katakana characters")
      end
      it 'last_furiganaは全角（カタカナ）で入力されていないと登録できない' do
        @user.last_furigana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last furigana Full-width katakana characters")
      end
      it 'last_furiganaは半角文字だと登録できない' do
        @user.last_furigana = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last furigana Full-width katakana characters")
      end
      it 'first_furiganaは半角文字だと登録できない' do
        @user.first_furigana = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana Full-width katakana characters")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
