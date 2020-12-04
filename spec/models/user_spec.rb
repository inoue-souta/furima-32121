require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "必要な全ての情報記入で登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上かつ半角英数混合であれば登録できる" do
        @user.password = "abc000"
        @user.password_confirmation = "abc000"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        # user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空では登録できない" do
        # user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000")
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        user1 = FactoryBot.build(:user)
        user1.email = @user.email
        user1.valid?
        expect(user1.errors.full_messages).to include("Email has already been taken")
      end
      it "emailは@を含まないと登録できない" do
        @user.email = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank","Password confirmation doesn't match Password"
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "000aa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password","Password is too short (minimum is 6 characters)"
      end
      it "passwordが半角英数字混合でないと登録できない" do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it "first_nameが半角では登録できない" do
        @user.first_name = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it "last_nameが半角では登録できない" do
        @user.last_name = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it "first_name_kanaが半角では登録できない" do
        @user.first_name_kana = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it "last_name_kanaが半角では登録できない" do
        @user.last_name_kana = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end