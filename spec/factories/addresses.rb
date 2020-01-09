FactoryBot.define do

  factory :address do
    name_family              {"田中"}
    name_first              {"太郎"}
    kana_family              {"タナカ"}
    kana_first              {"タロウ"}
    postal_code              {"999-9999"}
    prefecture              {"1"}
    municipality              {"渋谷区"}
    house_number              {"1-1-1"}
  end

end