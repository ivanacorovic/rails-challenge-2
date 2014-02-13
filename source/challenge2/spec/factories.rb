FactoryGirl.define do


  factory :comment do
    sequence(:comment)  {"Comment tralala"}
    user
    story
  end

  factory :story do
    sequence(:id) {|n| n } 
    sequence(:active) { true}
    sequence(:url) {'https://www.google.com'}
    sequence(:title) {|n| "Title #{n}"}
    sequence(:description) {"Description"}
    user

    factory :inactive_story do
      active false
    end

    factory :story_with_comments do
      ignore do
        comment_count 10
      end
      after(:create) do |story, evaluator|
        create_list(:comment, evaluator.comment_count)
      end
    end

  end


  factory :user do
    sequence(:username)  { |n| "username#{n}" }
    sequence(:email) { |n| "email#{n}@gmail.com"}
    sequence(:about)  { |n| "Blah blah Blah" }
    sequence(:first_name)  { |n| "Person #{n}" }
    sequence(:last_name) { |n| "person_#{n} last"}

    factory :user_with_stories do
      ignore do
        story_count 5
      end
      after(:create) do |user, evaluator|
        create_list(:story, evaluator.story_count, user: user)
        create_list(:inactive_story, evaluator.story_count, user: user)
      end
    end
  end 
end