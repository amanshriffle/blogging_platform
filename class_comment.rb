class Comment
  attr_accessor :comment, :comment_by

  def initialize(comment, comment_by)
    @comment = comment
    @comment_by = comment_by
  end

  def display_comment
    puts "Comment: #@comment"
    puts "Comment By: #@comment_by"
  end
end
