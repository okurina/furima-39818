FactoryBot.define do
  factory :item do
    category_id        { Faker::Number.between(from: 2, to: 11) }
    situation_id       { Faker::Number.between(from: 2, to: 7) }
    delivery_charge_id { Faker::Number.between(from: 2, to: 3) }
    region_id          { Faker::Number.between(from: 2, to: 48) }
    shipment_id        { Faker::Number.between(from: 2, to: 4) }
    price              { Faker::Number.between(from: 300, to: 9_999_999) }
    item_name          { Faker::Lorem.sentence(word_count: 3) }
    content            { Faker::Lorem.sentence }
    image              { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/test.jpg')) }
    association :user
  end
end
