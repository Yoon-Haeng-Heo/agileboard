TITLES = ["Ruby On Rails", "Spring Boot", "React", "Node Express", "Php", "Python and Django", "Android", "IOS"]
IMAGES = ['/public/image/1.jpg', '/public/image/2.jpg', '/public/image/3.jpg', '/public/image/4.jpg']

AdminUser.create!(email: 'admin@test.com', password: '123456', password_confirmation: '123456') if Rails.env.development?

def get_user
  User.order("RANDOM()").limit(1).first
end 

def get_project
  Project.order("RANDOM()").limit(1).first
end

def generate_project title = "프로젝트"
  5.times do 
    Project.create(name: TITLES.sample + " " + title, description: Faker::Lorem.sentence(word_count: 100), start_at: Date.today, end_at: Date.today + 5.days)
    puts "프로젝트 생성"
  end
end

def generate_users 
  5.times do
    user_info = {
      email: Faker::Internet.email,
      password: "password",
      name: "#{Faker::Name.name}",
      phone: "010-1234-5678",
    }

    User.customer.create(user_info)
    puts "고객 생성"
  end

  5.times do
    user_info = {
      email: Faker::Internet.email,
      password: "password",
      name: "#{Faker::Name.name}",
      phone: "010-1234-5678",
    }

    User.developer.create(user_info)
    puts "개발자 생성"
  end
end

def generate_posts
  5.times do 
    post = Post.create( user: get_user, title: Faker::Computer.platform + " 게시글", body: Faker::Lorem.sentence(word_count: 100), project: get_project, image: Faker::LoremFlickr.image("50x60") )
    puts "게시글 생성"
  end
end

generate_project
generate_users
generate_posts