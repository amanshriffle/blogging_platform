module FollowUnfollowUser
  def follow_unfollow_user
    begin
      puts "\n", "--" * 30
      puts "Type 0 and press enter to go back"
      print "Enter username to follow/unfollow: "
      username = gets.strip.downcase

      return if username == '0'
      raise "\nPlease enter valid username" if username.empty?
      raise "\nYou can not follow yourself!!" if username == logged_user.username

      user_to_follow_unfollow = users.find {|user|
        user.username == username
      }

      raise "\nNo account found with this username" if user_to_follow_unfollow==nil
    rescue => e
      puts e
      sleep 1
      retry
    end

    if user_to_follow_unfollow.followers.include?(logged_user.username)
      begin
        puts "\nYou already following #{user_to_follow_unfollow.username}\n"
        puts "--" * 30
        puts '0. Go back to main menu'
        puts "1. Unfollow #{user_to_follow_unfollow.username}"
        print "Please enter your choice: "
        option = gets.strip

        raise "\nPlease enter valid option\n" unless option.match(/\A[0-1]\z/)

        case option
          when '0'
            return
          when '1'
            user_to_follow_unfollow.followers.delete(logged_user.username)
            logged_user.following.delete(user_to_follow_unfollow.username)
            puts "\nYou unfollowed #{user_to_follow_unfollow.username}!"
        end

      rescue => e
        puts e
        retry
      end
    else
      user_to_follow_unfollow.followers.push(logged_user.username)
      logged_user.following.push(user_to_follow_unfollow.username)

      puts "\nNow, you are following #{user_to_follow_unfollow.username}"
      user_to_follow_unfollow.notifications << "#{logged_user.username} is started following you"
    end

    puts "\nPress Enter to go back to main menu."
    exit = gets
    return
  end
end
