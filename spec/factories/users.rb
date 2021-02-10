FactoryBot.define do
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"aaa111"}
    password_confirmation {"aaa111"}
    first_name            {"海"}
    last_name             {"山"}
    first_furigana        {"ウミ"}
    last_furigana         {"ヤマ"}
    birthday              {"1935-03-03"}    
  end
end