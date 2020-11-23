class UserMailer < ApplicationMailer
  default :from => 'tjdals1771@gmail.com'
  
  def send_post_created_email(post)
    @post = post
    @post.participant_list.each do |user|
      unless user == ""
        mail(to: User.find_by(id: user).email, subject: 'Post created successfully!')
      end
    end
  end
  
  def send_comment_mentioned_email(mention_email, comment)
    @comment = comment
    mention_email.each do |email|
      mail(to: email, subject: 'mentioned')
    end
  end

end
