module PostOptions
  def post_options(post)
    begin
      puts "--" * 30
      puts "Selected post:- "
      post.display_post

      puts '--' * 30
      puts "1. like the Post"
      puts "2. Add comment"
      puts '3. Show comments'
      puts '4. Show who liked the post'
      puts '5. Go back to main menu'
      print 'Pleas enter your choice: '
      option = gets.strip

      raise "\nPlease enter valid option\n\n" unless option.match(/\A[1-5]\z/)

      return if option == '0'

      case option.to_i
        when 1
          like_post(post)
        when 2
          comment_on_post(post)
        when 3
          show_comments(post)
        when 4
          post_liked_by(post)
        when 5
          return
      end

      raise ""

      rescue => e
      puts e
      sleep 1
      retry
    end
  end
end
