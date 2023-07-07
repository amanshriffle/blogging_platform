module DisplayPosts
  def display_posts
    if all_posts.empty?
      puts "\nNo post available\n\n"
      sleep 2
      return
    end

    puts "\nLatest posts: "

    if all_posts.length > 1
      (all_posts.sort! {|a,b| b.publication_date <=> a.publication_date}).each_with_index { |post, post_index|
        puts "--" * 30
        puts "Post no. #{post_index+1}"
        if post.author == logged_user.username
          post.author= "You (#{post.author})"
          post.display_post
          post.author= "#{logged_user.username}"
        else
          post.display_post
        end
      }
    else
      puts "--" * 30
      puts "Post no. 1"
      all_posts[0].display_post
    end

    begin
      puts "\n", "__" *30
      puts "Type 0 and enter to go back to main menu"
      print 'Enter post number to select: '
      post_number = gets.strip

      raise "\nPlease enter valid input\n" unless post_number.match(/\A[\d]+\z/)

      post = all_posts[post_number.to_i - 1]

      raise "\nPlease enter valid input\n" if post_number.empty?

      return if post_number == '0'

      if post == nil
        raise "\nPlease enter valid option\n"
      end

      rescue => e
      puts e
      retry
    end

    post_options(post)

  end
end
