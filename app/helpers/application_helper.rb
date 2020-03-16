module ApplicationHelper
  include Private::ConversationsHelper
  
  def user_avatar(user, size=40)
    if @profile.avatar.attached?
      @profile.avatar.variant(resize: "300x300")
    else
      gravatar_image_url(user.email, size: size)
    end
  end
  
end   