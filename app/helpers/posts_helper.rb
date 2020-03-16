module PostsHelper
    def contact_user_partial_path
        if user_signed_in?
         @post.user.id != current_user.id ? 'posts/show/contact_user' : 'shared/empty_partial'
        else 
         'posts/show/login_required'
        end
    end
    
    def leave_message_partial_path
      if @message_has_been_sent
        'posts/show/contact_user/already_in_touch'
      else
        'posts/show/contact_user/message_form'
      end
    end
end
