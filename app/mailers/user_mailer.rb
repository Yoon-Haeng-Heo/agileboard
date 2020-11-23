class UserMailer < ApplicationMailer
  default :from => 'tjdals1771@gmail.com'
  
  def send_post_created_email(user, post_params)
    @user = user
    @post_params = post_params
    mail(to:'codingmachine1771@gmail.com', subject: 'Post created successfully!' )
  end
  
  def send_comment_mentioned_email(mention_email, comment)
    @comment = comment
    mention_email.each do |email|
      mail(to: email, subject: 'mentioned')
    end
  end

end
