FactoryGirl.define do

  factory :shout do
    user
  end

  factory :text_shout do
    body "some text"
    shout
  end

  factory :photo_shout do
    photo_file_name "blue.jpg"
    shout
  end

end
