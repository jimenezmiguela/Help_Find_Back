
# Help_Find_Back
# FactoryBot factory for test status_report
FactoryBot.define do
  factory :status_report do
    description { Faker::Lorem.word }
    details { Faker::Lorem.word }
    association :missing_person
  end
end
