module PostLikedBy
  def post_liked_by(post)
    return puts "\nNo likes on this post\n" if post.like_by.empty?
    print "\nLikes: #{post.like_by.length} "
    post.like_by.each {|liked_by| print "(#{liked_by}) "}

    print "\n\nPress enter to go back"
    exit = gets
    return
  end
end