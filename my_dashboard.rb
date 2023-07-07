module Dashboard
  def my_dashboard
    total_posts = logged_user.posts.length;
    total_likes = 0;
    total_comments = 0;
    followers = logged_user.followers.length;
    following = logged_user.following.length;
    notifications = logged_user.notifications.length;

    logged_user.posts.each {|post|
      total_comments += post.comments.length
      total_likes += post.like_by.length
    }

    puts "\n","--"*30
    puts "Total Posts: #{total_posts}"
    puts "Total Likes: #{total_likes}"
    puts "Total Comments: #{total_comments}"
    puts "Followers: #{followers}"
    puts "Following: #{following}"
    print "Notifications: #{notifications} "

    logged_user.notifications.each {|n|
      print "(#{n}) "
    }

    logged_user.notifications.clear

    puts "\n\nPress enter to go back to main menu"
    exit = gets
    return
  end
end
