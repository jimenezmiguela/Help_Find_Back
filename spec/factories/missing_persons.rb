
# Help_Find_Back
# FactoryBot factory for test missing_person
require 'faker'

# random data
FactoryBot.define do
  factory :missing_person do |f|
    f.name { Faker::Lorem.word }
    f.sex { Faker::Lorem.word }
    f.race { Faker::Lorem.word }
  end
end
