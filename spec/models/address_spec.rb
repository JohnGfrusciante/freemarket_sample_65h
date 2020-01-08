require 'rails_helper'

describe Address do
  describe '#create' do
    # 1. name_family, name_first, kana_family, kana_first, postal_code, prefecture, municipality, house_numberが存在すれば登録できること
    it "is valid with a name_family, name_first, kana_family, kana_first, postal_code, prefecture, municipality, house_number" do
      address = build(:address)
      expect(address).to be_valid
    end

    # 2. name_familyが空では登録できないこと
    it "is invalid without a name_family" do
      address = build(:address, name_family: nil)
      address.valid?
      expect(address.errors[:name_family]).to include("can't be blank")
    end

    # 3. name_firstが空では登録できないこと
    it "is invalid without a name_first" do
      address = build(:address, name_first: nil)
      address.valid?
      expect(address.errors[:name_first]).to include("can't be blank")
    end

    # 4. kana_familyが空では登録できないこと
    it "is invalid without a kana_family" do
      address = build(:address, kana_family: nil)
      address.valid?
      expect(address.errors[:kana_family]).to include("can't be blank")
    end

    # 5. kana_firstが空では登録できないこと
    it "is invalid without a kana_first" do
      address = build(:address, kana_first: nil)
      address.valid?
      expect(address.errors[:kana_first]).to include("can't be blank")
    end

    # 6. postal_codeが空では登録できないこと
    it "is invalid without a postal_code" do
      address = build(:address, postal_code: nil)
      address.valid?
      expect(address.errors[:postal_code]).to include("can't be blank")
    end

    # 7. prefectureが空では登録できないこと
    it "is invalid without a prefecture" do
      address = build(:address, prefecture: nil)
      address.valid?
      expect(address.errors[:prefecture]).to include("can't be blank")
    end

    # 8. municipalityが空では登録できないこと
    it "is invalid without a municipality" do
      address = build(:address, municipality: nil)
      address.valid?
      expect(address.errors[:municipality]).to include("can't be blank")
    end

    # 9. house_numberが空では登録できないこと
    it "is invalid without a house_number" do
      address = build(:address, house_number: nil)
      address.valid?
      expect(address.errors[:house_number]).to include("can't be blank")
    end
  end
end