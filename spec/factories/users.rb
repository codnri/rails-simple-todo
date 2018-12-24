FactoryBot.define do
  factory :user do
    
    #データを生成する毎に通し番号をふってユニークな値を作る
    # sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    password "password"
    password_confirmation "password"
  end
end
