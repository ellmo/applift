include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :image do
    gadget
    image_file { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'ellmo.png')) }

    trait :png do
      image_file { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'ellmo.png')) }
    end

    trait :jpg do
      image_file { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'ellmo.jpg')) }
    end

    factory :image_png, traits: [:png]
    factory :image_jpg, traits: [:jpg]
  end
end
