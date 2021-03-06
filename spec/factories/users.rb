FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"abc000"}
    password_confirmation {"abc000"}
    first_name            {"あ"}
    last_name             {"い"}
    first_name_kana       {"ア"}
    last_name_kana        {"イ"}
    birthday              {"1995-06-21"}
  end
end