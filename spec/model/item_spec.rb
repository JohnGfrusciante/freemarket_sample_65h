require 'rails_helper'

describe Item do
  describe '#create' do

    it "is valid with name, discription, price, condition, shipping_charge, shipping_date, prefecture" do
      item = build(:item)
      expect(item).to be_valid
    end

    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a discription" do
      item = build(:item, discription: nil)
      item.valid?
      expect(item.errors[:discription]).to include("can't be blank")
    end

    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "is invalid without a condition" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("can't be blank")
    end

    it "is invalid without a shipping_charge" do
      item = build(:item, shipping_charge: nil)
      item.valid?
      expect(item.errors[:shipping_charge]).to include("can't be blank")
    end

    it "is invalid without a shipping_date" do
      item = build(:item, shipping_date: nil)
      item.valid?
      expect(item.errors[:shipping_date]).to include("can't be blank")
    end

    it "is invalid without a prefecture" do
      item = build(:item, prefecture: nil)
      item.valid?
      expect(item.errors[:prefecture]).to include("can't be blank")
    end
   
  end
end