crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypages_path
  parent :root
end

crumb :profiles do
  link "プロフィール", profiles_path
  parent :mypage
end

crumb :informations do
  link "本人情報の登録", informations_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_path
  parent :mypage
end

crumb :creditcard do
  link "支払い方法", creditcard_path
  parent :mypage
end

crumb :cardregister do
  link "クレジットカード情報入力", cardregister_path
  parent :creditcard
end