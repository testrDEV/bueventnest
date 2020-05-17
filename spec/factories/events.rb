FactoryBot.define do
  factory :event do
    name { "MyString" }
    description { "MyText" }
    location { "MyString" }
    start_date { "2020-05-16" }
    end_date { "2020-05-16" }
    contact { "MyString" }
    seats { 1 }
  end
end
