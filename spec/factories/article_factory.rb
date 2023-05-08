FactoryBot.define do
    factory :article do
        user_id {"1"}
        title { "Article test" }
        body  { "abcdefghijk" }
        status { "public"}
    end
end