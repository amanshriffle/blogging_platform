module ListFollowersFollowing
  def list_followers_following
    begin
      puts "--" * 30
      puts "1. Show Followers"
      puts "2. Show Following"
      puts "3. Go to main menu"
      print "Enter your choice: "
      choice = gets.strip

      raise "\nPlease enter valid choice\n\n" unless choice.match(/\A[1-3]\z/)

      case choice.to_i
      when 1
        if logged_user.followers.empty?
          puts "\nYou don't have any follower\n\n"
          raise ''
        end
        logged_user.list_followers
        print "\nPress enter to go to main menu"
        back = gets
        return
      when 2
        if logged_user.following.empty?
          puts "\nYou are not following anyone\n\n"
          raise ''
        end
        logged_user.list_following
        print "\nPress enter to go to main menu"
        back = gets
        return
      when 3
        return
      end

    rescue => e
      print e
      sleep 1
      retry
    end
  end
end
