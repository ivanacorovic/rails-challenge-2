namespace :db do
  desc "Fill database with sample data"
    task populate: :environment do
      User.create!(username: "johny",
                  email: "johny@gmail.com",
                  about: "Let others speak for me.",
                  first_name: "Johny",
                  last_name: "Markovich")
      User.create!(username: "ben",
                  email: "ben@gmail.com",
                  about: "Ooh, I don't know what to say.",
                  first_name: "Ben",
                  last_name: "Smith")
       User.create!(username: "george",
                  email: "george@gmail.com",
                  about: "I am amazing",
                  first_name: "George",
                  last_name: "Adams")
      


      3.times do |n|
        Story.create!(user_id: 1, active: true, url: "https://www.google.com",
                      title: "Story#{n}", description: "This is my Story #{n}")
      end
      2.times do |n|
        Story.create!(user_id: 2, active: true, url: "https://www.pmf.ac.me",
                      title: "Story#{n}", description: "This is my Story #{n}")
      end
      2.times do |n|
        Story.create!(user_id: 3, active: true, url: "https://www.yahoo.com",
                      title: "Story#{n}", description: "This is my Story #{n}")
      end

      Story.create!(user_id: 1, active: false, url: "https://www.example.org",
                      title: "My Story", description: "This is my Story, I'm so proud at it.") 
      2.times do |n|
        Story.create!(user_id: 2, active: false, url: "https://www.example.org",
                      title: "Story#{n}", description: "This is my Story #{n}")
      end
      2.times do |n|
        Story.create!(user_id: 3, active: false, url: "https://www.example.org",
                      title: "Story#{n}", description: "This is my Story #{n}")
      end

      3.times do |n|
        case n
        when 0
          k=1
        when 1
          k=4
        when 2
          k=6
        end
          Comment.create!(story_id: k, user_id: rand(3)+1, comment: "Awesome!")
          Comment.create!(story_id: k+1, user_id: rand(3)+1, comment: "Cool!")
          Comment.create!(story_id: k+1, user_id: rand(3)+1, comment: "Pfff!")
        
      end

  end
end