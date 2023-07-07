class User
  attr_accessor :username, :email, :password, :posts, :followers, :notifications, :following

  def initialize(username,email,password)
    @username = username
    @email = email
    @password = password
    @posts = []
    @followers = []
    @notifications = []
    @following = []
  end

  def list_followers
    puts "--" * 30
    puts 'Followers:- '
    followers.each_with_index {|follower,i|
      print "#{i+1}. "
      puts "#{follower}"
    }
  end

  def list_following
    puts "--" * 30
    puts 'You are following:- '
    following.each_with_index {|following,i|
      print "#{i+1}. "
      puts "#{following}"
    }
  end
end
