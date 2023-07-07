module CommentOnPost
  def comment_on_post(post)
    begin
      puts "\n","--"*30
      puts "Type 0 and enter to go back."
      print 'Enter comment: '
      comment = gets.strip

      return if comment == '0'
      raise "\nCan not post empty comment, please enter comment-" if comment.empty?

      comment_obj = Comment.new(comment, logged_user.username)
      post.add_comment(comment_obj)
      puts "\nComment posted successfully!"

      notifications(post.author,"#{logged_user.username} commented on your post. Post url is #{post.url}") if logged_user.username != post.author
      sleep 1

    rescue => e
      puts e
      retry
    end
  end
end
