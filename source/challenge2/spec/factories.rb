FactoryGirl.define do
  factory :user do
    sequence(:username)  { |n| "username#{n}" }
    sequence(:email) { |n| "email#{n}@gmail.com"}
    sequence(:about)  { |n| "Blah blah Blah" }
    sequence(:first_name)  { |n| "Person #{n}" }
    sequence(:last_name) { |n| "person_#{n} last"}

  end

  factory :story do
    sequence(:active) { true}
    sequence(:url) {'https://www.google.com'}
    sequence(:title) {|n| "Title #{n}"}
    sequence(:description) {"Description"}
    user
    
  end

  factory :comment do
    sequence(:comment)  {"Comment kdfss"}
    user
    story
  end
end