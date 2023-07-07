module SearchByTag
  def search_by_tags
    begin
      puts "\n", "--" * 30
      puts "Type 0 and enter to go back"
      print "Enter tag: "
      search_input = gets.strip.downcase
      
      return if search_input == '0'
      raise "\nPlease enter valid tag!!" if search_input.empty?
    
    rescue => e
      puts e
      retry  
    end
    
    not_found = true

    all_posts.each {|post|
      if post.tags.include?(search_input)
        puts "--" * 30
        puts "URL: #{post.url}"
        if post.author == logged_user.username
          post.author= "You (#{logged_user.username})"
          post.display_post
          post.author= "#{logged_user.username}"
        else
          post.display_post
        end
        not_found = false
      end
    }

    return puts "\nNo post found with #{search_input} tag\n" if not_found
    
    begin
      puts "\n", "--" * 30
      puts "Type 0 and enter to go back"
      print 'Enter post URL to select: '
      post_url = gets.strip.downcase
      post = all_posts.find {|post| post.url == post_url}
  
      return if post_url == '0'
  
      raise "\nPlease enter valid URL\n" if post == nil
      
    rescue => e
      puts e
      retry
    end

    post_options(post)
  end
end

