TITLES = ["Ruby On Rails", "Spring Boot", "React", "Node Express", "Php", "Python and Django", "Android", "IOS"]

SIMAGES=['test1.jpg', 'test2.jpg', 'test3.jpg', 'test4.jpg', 'test5.jpg', 'app.png', 'rails1.png','8.app.jpg','9.ios.png','android1.jpg','html.jpg','ios.jpg','ios2.jpg','ios3.jpg','ios10.png','rails.png','rails3.png','react.jpg','react2.jpg','web.jpg']
ROOT= "/public/image/seedimage/"
STATUS= [:to_do,:in_progress,:complete ,:feedback, :end]
# AdminUser.create!(email: 'admin@test.com', password: '123456', password_confirmation: '123456') if Rails.env.development?

def get_user
  User.order("RANDOM()").limit(1).first
end 

def get_users
  User.order("RANDOM()").limit(3)
end

def get_project
  Project.order("RANDOM()").limit(1).first
end

def destroy_all_data
  Post.destroy_all
  puts "Post 삭제"

  User.destroy_all
  puts "User 삭제"
  
  Function.destroy_all
  puts "Function 삭제"

  Project.destroy_all
  puts "Project 삭제"
end

def generate_project title = "프로젝트"
  5.times do 
    image_field = File.open(("#{Rails.root}"+ROOT+SIMAGES.shuffle.first))
    Project.create(name: TITLES.shuffle.first + " " + title, description: Faker::Lorem.sentence(word_count: 100), image: image_field, start_at: Date.today, end_at: Date.today + 5.days)
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

def generate_userprojects
  15.times do
    get_user.user_projects.create(project: get_project)
  end
  puts "프로젝트에 유저 추가"
end

def generate_posts
  20.times do 
    image_field = File.open(("#{Rails.root}"+ROOT+SIMAGES.shuffle.first))
    post = Post.create( user: get_user, title: Faker::Computer.platform + " 게시글", body: Faker::Lorem.sentence(word_count: 100), project: get_project, image: image_field )
    puts "게시글 생성"
  end
end

def generate_functions
  20.times do
    function = Function.new(title: Faker::Hacker.adjective + " 구현하기" ,description: Faker::Hacker.say_something_smart, start_at: Date.today, end_at: Date.today + 10.days , project: get_project, user_list: [], aasm_state: STATUS.shuffle.first)
    function.user_list.add(get_users.ids)
    function.save
  end
  puts "기능 생성"
end

destroy_all_data
generate_project
generate_users
generate_userprojects
generate_posts
generate_functions