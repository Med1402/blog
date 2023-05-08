FactoryBot.define do
    factory :user do

        username { "John" }
        password  { "test1234" }
        email { 'test@test.com' }
        
    end
end