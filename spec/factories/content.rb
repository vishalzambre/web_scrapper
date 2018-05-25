FactoryBot.define do
  factory :content do
    tag "h1"
    text "Test heading"
    association :page, factory: :page
  end
end
