module LikePost
  def like_post(post)
    if post.like_by.include?(logged_user.username)
      begin
        puts "\nYou already liked the post\n"
        puts "0. To go back"
        puts "1. To unlike the post"
        print "Enter your choice: "
        input_like = gets.strip

        raise "\nPlease enter valid option\n" unless input_like.match(/\A[0-1]\z/)
        return if input_like == '0'

        post.like_by.delete(logged_user.username)
        puts "\n-------Unliked---------"
      rescue => e
        puts e
        sleep 1
        retry
      end
    else
      post.add_like_by (logged_user.username)
      puts "\nYou have liked the post"
      notifications(post.author,"#{logged_user.username} liked your post. Post url is #{post.url}") if logged_user.username != post.author
      sleep 1
    end
  end
end
