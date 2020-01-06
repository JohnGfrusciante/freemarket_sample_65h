FactoryBot.define do
  factory :item do
    name              {"test"}
    discription       {"テストする為のフェイクデータ"}
    price             {5000}
    condition         {1}
    shipping_charge   {1}
    shipping_date     {1}
    prefecture        {1}
  end
end