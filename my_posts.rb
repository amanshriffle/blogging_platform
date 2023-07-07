module MyPost
  def my_posts
    if logged_user.posts.empty?
      puts "\nYou have not posted anything!\n\n"
      sleep 1
      return
    end

    logged_user.posts.each {|post|
      puts "\n", "--" * 5 + "My Posts" + "--"*5, "\n"
      puts "URL: #{post.url}"
      post.author= "You (#{logged_user.username})"
      puts post.display_post
      post.author= "#{logged_user.username}"
    }

    begin
      puts "--" * 30
      puts "Type 0 and enter to go back to main menu"
      print "Enter post url to delete: "
      input_url = gets.strip.downcase

      return if input_url == '0';
      raise "\nPlease Enter valid url" if input_url.empty?

      post = logged_user.posts.find {|post| post.url == input_url}
      raise "\nPlease Enter valid url" if post == nil

      logged_user.posts.delete(post)
      all_posts.delete(post)

      puts "\nPost deleted successfully!!"
      sleep 1
      my_posts
    rescue => e
      puts e
      sleep 1
      retry
    end
  end
end
