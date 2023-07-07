module ShowComments
  def show_comments(post)
    return puts "\nNo comment available on this post\n" if post.comments.empty?
      
    post.comments.each_with_index {|comment,i|
      puts "\n", "--" *30
      puts "Comment no. #{i+1}"
      comment.display_comment
    }
    
    print "\nPress enter to go back."
    exit = gets
    return
  end
end