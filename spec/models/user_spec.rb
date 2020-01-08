require 'rails_helper'

describe User do
  describe '#create' do
    # 1. nickname, email, password, name_family, name_first, kana_family, kana_first, birthday, tel, profitが存在すれば登録できること
    it "is valid with a nickname, email, password, name_family, name_first, kana_family, kana_first, birthday, tel, profit" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # 3. emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # 4. passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 5. name_familyが空では登録できないこと
    it "is invalid without a name_family" do
      user = build(:user, name_family: nil)
      user.valid?
      expect(user.errors[:name_family]).to include("can't be blank")
    end

    # 6. name_firstが空では登録できないこと
    it "is invalid without a name_first" do
      user = build(:user, name_first: nil)
      user.valid?
      expect(user.errors[:name_first]).to include("can't be blank")
    end

    # 7. kana_familyが空では登録できないこと
    it "is invalid without a kana_family" do
      user = build(:user, kana_family: nil)
      user.valid?
      expect(user.errors[:kana_family]).to include("can't be blank")
    end

    # 8. kana_firstが空では登録できないこと
    it "is invalid without a kana_first" do
      user = build(:user, kana_first: nil)
      user.valid?
      expect(user.errors[:kana_first]).to include("can't be blank")
    end

    # 9. birthdayが空では登録できないこと
    it "is invalid without a birthday" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    # 10. telが空では登録できないこと
    it "is invalid without a tel" do
      user = build(:user, tel: nil)
      user.valid?
      expect(user.errors[:tel]).to include("can't be blank")
    end

    # 11. profitが空では登録できないこと
    it "is invalid without a profit" do
      user = build(:user, profit: nil)
      user.valid?
      expect(user.errors[:profit]).to include("can't be blank")
    end

    # 12. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # 13. 重複したtelが存在する場合登録できないこと
    it "is invalid with a duplicate tel" do
      user = create(:user)
      another_user = build(:user, tel: user.tel)
      another_user.valid?
      expect(another_user.errors[:tel]).to include("has already been taken")
    end

    # 14. passwordが7文字以上であれば登録できること
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    # 15. passwordが6文字以下であれば登録できないこと
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end
  end
end