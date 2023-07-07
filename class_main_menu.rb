require_relative 'write_post'
require_relative 'display_posts'
require_relative 'search_post'
require_relative 'search_by_title'
require_relative 'search_by_tags'
require_relative 'follow_unfollow_user'
require_relative 'my_dashboard'
require_relative 'my_posts'
require_relative 'notification'
require_relative 'post_options'
require_relative 'like_post'
require_relative 'comment_on_post'
require_relative 'show_comments'
require_relative 'show_post_liked_by'
require_relative 'list_followers_following'

class MainMenu
  attr_accessor :logged_user, :users

  def initialize(users,logged_user)
    @users = users
    @logged_user = logged_user
    @all_posts = []

    users.each {|user|
      @all_posts += user.posts if !user.posts.empty?
    }
  end

  include WritePost
  include DisplayPosts
  include SearchPost
  include SearchByTitle
  include SearchByTag
  include FollowUnfollowUser
  include Dashboard
  include MyPost
  include Notification
  include PostOptions
  include LikePost
  include CommentOnPost
  include ShowComments
  include PostLikedBy
  include ListFollowersFollowing

  def set_all_posts (post)
    @all_posts << post
  end

  def all_posts
    return @all_posts
  end

  def show_main_menu
    while true do
      puts "--" * 30
      puts "Welcome #{logged_user.username} in MyBlog.com"
      puts "1. Write a Post"
      puts "2. Display Posts"
      puts "3. Search Posts"
      puts "4. Follow/unfollow User"
      puts "5. My Posts"
      puts "6. Display Followers/Following"
      puts "7. My DashBoard"
      puts "8. Log Out"
      puts "9. Exit"
      print "Please enter your choice: "

      main_input = gets.strip

      unless main_input.match(/\A[1-9]\z/)
        puts "\nPlease enter valid input\n\n"
        sleep 1
        redo
      end

      case main_input.to_i
      when 1
        write_post
      when 2
        display_posts
      when 3
        search_post
      when 4
        follow_unfollow_user
      when 5
        my_posts
      when 6
        list_followers_following
      when 7
        my_dashboard
      when 8
        puts "\nLogged out!!\n"
        return
      when 9
        throw :exit;
      end
    end
  end
end
